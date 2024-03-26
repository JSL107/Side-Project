package com.hdsm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hdsm.domain.MemberSbagDTO;
import com.hdsm.domain.MemberSbagDTOForJsp;
import com.hdsm.domain.MemberVO;
import com.hdsm.domain.OrderListVO;
import com.hdsm.service.MemberService2;
import com.hdsm.service.ProductService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member1/*")
public class MemberController2 {
	
	@Autowired
	MemberService2 memberservice;
	
	@Autowired
	ProductService productservice;
	
	// 로그인 페이지 진입
	@GetMapping("/loginForm")
	public String loginForm() {
		return "member/loginForm";
	}
	
	// 회원가입 페이지 진입
	@GetMapping("/joinForm")
	public String joinForm() {
		return "member/joinForm";
	}
	
	// 회원가입
	@RequestMapping(value="/join", method = RequestMethod.POST)
	public String join(MemberVO member, HttpServletRequest request) throws Exception {
		
		// jsp에서 name에 입력된 값 vo에 저장
		member.setMid(request.getParameter("custId"));
		member.setMpassword(request.getParameter("custPwd"));
		member.setMname(request.getParameter("custName"));
		member.setMemail(request.getParameter("emailtotal"));
		member.setMtel(request.getParameter("custTel"));
		member.setMaddress1(request.getParameter("partner.postNo"));
		member.setMaddress2(request.getParameter("partner.addr1"));
		member.setMzipcode(Integer.parseInt(request.getParameter("zonecode")));
		// 회원가입 실시
		memberservice.insertMember(member);

		return "member/joinResult";
	}
	
	// 아이디 중복 체크
	@RequestMapping(value="/midCheck", method=RequestMethod.POST)
	@ResponseBody						//ajax에서 넘어올 데이터 이름
	public String midCheck(@RequestParam("memberId") String memberId) throws Exception{
		log.info("id 중복 검사");
		
		int result = memberservice.idCheck(memberId);	//결과 값 int로 받아주기 (mapper 에서 count)
		log.info(result);

		if( result != 0) {	//int에 값이 있으면 중복값이 존재
			return "fail";
		} else {			//없으면 사용가능한 아이디
			return "success";
		}
	}
	
	// 연락처 중복 체크
	@RequestMapping(value="/mtelCheck", method=RequestMethod.POST)
	@ResponseBody						//ajax에서 넘어올 데이터 이름
	public String mtelCheck(@RequestParam("memberTel") String memberTel) throws Exception{
		log.info("id 중복 검사");
		
		int result = memberservice.telCheck(memberTel);	//결과 값 int로 받아주기 (mapper 에서 count)
		log.info(result);

		if( result != 0) {	//int에 값이 있으면 중복값이 존재
			return "fail";
		} else {			//없으면 사용가능한 아이디
			return "success";
		}
	}
	
	
	// 로그인
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(MemberVO member, HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession(); // 세션

		String mid = "";
		String mpwd = "";

		mid = member.getMid(); // 사용자 입력값 저장
		mpwd = member.getMpassword(); // 사용자 비밀번호 저장

		MemberVO vo = memberservice.login(member); // mapper -> service 에서 가져온 db값(mid,mpassword)를 객체에 저장
//			String id = vo.getMid();
//			String pw = vo.getMpassword();
//			System.out.println(id+" "+pw);

		if (vo != null) { // 객체에 값이 있으면 로그인 가능
			System.out.println("로그인 성공");
			session.setAttribute("member", mid); // member 변수에 id값 저장
			session.setAttribute("mname", vo.getMname()); // member 변수에 id값 저장
			
			String name = (String) session.getAttribute("member"); // member 가져와서 저장
			System.out.println(name);

			return "/home"; // home으로 이동

		} else {
			System.out.println("로그인 실패");
			return "member/loginForm";
		}
	}
	

	/* 메인페이지 로그아웃 */
	@RequestMapping(value="/logout", method=RequestMethod.GET)
   public String logoutMainGET(HttpServletRequest request) throws Exception{

       HttpSession session = request.getSession(); //세션
       
       session.invalidate(); //다 없애 버림    세션을 지우는 방법은 두가지 invalidate()", "removeAttribute() 가있는데 앞에있는거는 다지우는거 뒤에있는거는 특정 세션 타게팅삭제
       
       return "home";  
	}
	
	// 유저 쇼핑백 페이지 로드
	// 회원가입 페이지 진입
	@GetMapping("/shoppingbag")
	public String userShoppingBag(
				@RequestParam("mid") String mid,
				Model model ) {
		List<MemberSbagDTOForJsp> list = memberservice.getMemberShoppingBag(mid);
		model.addAttribute("shoppingbagList",list);

		return "member/shoppingbag";
	}
	
	// 장바구니 담기
	@PostMapping("/insertShoppingbag")
	@ResponseBody// 이거 안하면 return값을 jsp 찾으라는걸로 인식함
	public String insertShoppingbag(HttpServletRequest request, MemberSbagDTO msVO) throws Exception {
		
		// jsp에서 name에 입력된 값 vo에 저장		
		msVO.setMid(request.getParameter("mid"));
		msVO.setPid(request.getParameter("pid"));
		msVO.setPsize(request.getParameter("psize"));
		msVO.setPcolor(request.getParameter("pcolor"));
		msVO.setPamount(Integer.parseInt(request.getParameter("pamount")));		
		
		// 장바구니 담기 실시
		memberservice.insertShoppingBags(msVO);

		return "good";

	}


	
	// 마이 페이지 진입
	@GetMapping("/mypage")
	public String mypageForm() {
		return "member/mypage";
	}
	
	@PostMapping("/order_page")
	public void order_page(OrderListVO olv, Model model,HttpServletRequest request) {
		HttpSession session=request.getSession();
		System.out.println("colorcode:"+olv.getOrders().get(0).getCcolorcode());
		model.addAttribute("member", memberservice.getMember((String)session.getAttribute("member")));
		//model.addAttribute("orderList",memberservice.getOrderPageInfo(olv.getOrders()));
		int realTotalPoint=0;
		int realTotalPrice=0;
		int realMilege=0;
		for(int i=0;i<olv.getOrders().size();i++) {
			realTotalPoint+=olv.getOrders().get(i).getTotalpoint();
			realTotalPrice+=olv.getOrders().get(i).getTotalprice();
			realMilege+=olv.getOrders().get(i).getMilege();
		}
		
		model.addAttribute("realTotalPoint",realTotalPoint);
		model.addAttribute("realTotalPrice",realTotalPrice);
		model.addAttribute("realMilege", realMilege);
	
	}

	
	
}
