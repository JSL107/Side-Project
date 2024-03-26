package com.hdsm.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.hdsm.domain.AddressVO;
import com.hdsm.domain.MemberAuthVO;
import com.hdsm.domain.MemberSbagDTO;
import com.hdsm.domain.MemberSbagDTOForJsp;
import com.hdsm.domain.MemberVO;
import com.hdsm.domain.MemberWishListDTO;
import com.hdsm.domain.MemberWishListDTOforJsp;
import com.hdsm.domain.OrderUserVO;
import com.hdsm.domain.ProductVO;
import com.hdsm.domain.ReviewAttachFileDTO;
import com.hdsm.domain.ReviewsDTO;
import com.hdsm.domain.ReviewsVO;
import com.hdsm.persistence.MemberMapper;
import com.hdsm.security.CustomUserDetailsService;
import com.hdsm.service.MemberService;
import com.hdsm.service.OrderService;
import com.hdsm.service.ProductService;
import com.hdsm.service.ReviewService;
import com.hdsm.service.ReviewsService;
import com.hdsm.util.ReviewUtil;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j
@RequestMapping("/member/*")
public class MemberController {

    @Autowired
    MemberService memberservice;

    @Autowired
    ProductService productservice;

    @Autowired
    OrderService orderservice;

    @Autowired
    ReviewService reviewservice;

    @Autowired
    ReviewsService reviewsservice;


    @Autowired
    MemberMapper mapper;

    @Autowired
    CustomUserDetailsService customdetailsservice;

    @Autowired
    PasswordEncoder pwencoder;

    // 회원가입 페이지 진입
    @GetMapping("/joinForm")
    public String joinForm() {
        return "member/joinForm";
    }

    public int changeDateInteger(String date1) {
        return Integer.parseInt(date1);
    }

    // 회원가입
    @RequestMapping(value = "/join", method = RequestMethod.POST)
    public String join(MemberVO member, HttpServletRequest request) throws Exception {

        BCryptPasswordEncoder scpwd = new BCryptPasswordEncoder();
        MemberAuthVO mavo = new MemberAuthVO();


        String gender = request.getParameter("gender");
        String age = request.getParameter("age");


        SimpleDateFormat format;
        format = new SimpleDateFormat("yyyy");
        String today_yy = format.format(new Date());
        String yy = age.substring(0, 4);
        System.out.println("회원가입 yy"+ yy);
        if (changeDateInteger(today_yy) <= changeDateInteger(yy) && changeDateInteger(yy) <= 1500) {
            return "/false";
        } else {
            String mm = age.substring(4, 6);
            System.out.println("회원가입 mm"+ mm);
            if (changeDateInteger(mm) <= 1 && changeDateInteger(mm) >= 12) {
                return "/false";
            } else {
                String dd = age.substring(6, 8);
                System.out.println("회원가입 dd"+ dd);
                if (changeDateInteger(dd) >= 31 && changeDateInteger(dd) <= 1) {
                    return "/false";
                } else {
                    // jsp에서 name에 입력된 값 vo에 저장
                    member.setMid(String.valueOf(request.getParameter("custId")));
                    member.setMpassword(request.getParameter("custPwd"));
                    member.setMname(request.getParameter("custName"));
                    member.setMemail(request.getParameter("emailtotal"));
                    member.setMtel(request.getParameter("custTel"));
                    member.setMaddress1(request.getParameter("partner.postNo"));
                    member.setMaddress2(request.getParameter("partner.addr1"));
                    member.setMzipcode(Integer.parseInt(request.getParameter("zonecode")));
                    member.setGender(request.getParameter("gender"));
                    member.setAge(changeDateInteger(today_yy) - (changeDateInteger(yy)));
                    member.setMstatus("");

                    // 암호화할 패스워드를 암호화 처리하여 password에 저장하고
                    String password = scpwd.encode(member.getMpassword()); // 암호화 된 password를 다시 vo에 저장
                    member.setMpassword(password);


                    mavo.setUsername(request.getParameter("custId"));
                    mavo.setAuthority("ROLE_USER");

                    // 회원 가입 실행
                    memberservice.insertMember(member);
                    mapper.insertMemberAutority(mavo);


                    return "member/joinResult";
                }
            }
        }


    }

    // 아이디 중복 체크
    @RequestMapping(value = "/midCheck", method = RequestMethod.POST)
    @ResponseBody                  //ajax에서 넘어올 데이터 이름
    public String midCheck(@RequestParam("memberId") String memberId) throws Exception {
        int result = memberservice.idCheck(memberId);   //결과 값 int로 받아주기 (mapper 에서 count)

        if (result != 0) {   //int에 값이 있으면 중복값이 존재
            return "fail";
        } else {         //없으면 사용가능한 아이디
            return "success";
        }
    }

    // 연락처 중복 체크
    @RequestMapping(value = "/mtelCheck", method = RequestMethod.POST)
    @ResponseBody                  //ajax에서 넘어올 데이터 이름
    public String mtelCheck(@RequestParam("memberTel") String memberTel, HttpSession session) throws Exception {

        int result = memberservice.telCheck(memberTel);   //결과 값 int로 받아주기 (mapper 에서 count)

        if (result != 0) {   //int에 값이 있으면 중복값이 존재
            return "fail";
        } else {         //없으면 사용가능한 아이디
            return "success";
        }
    }

    // 로그인
    @RequestMapping(value = "/loginForm", method = RequestMethod.GET)
    public void loginInput(String error, String logout, Model model) {

        if (error != null) {
            model.addAttribute("error", "Login Error check your Account");
        }//end if

        if (logout != null) {
            model.addAttribute("logout", "LoginOut!! ");
        }//end if
    }

    @GetMapping("/logout")
    public String raffleLogout() {
        return "/member/logout";
    }

    /*로그아웃 */
    @RequestMapping(value = "/customLogout", method = RequestMethod.GET)//받는 형태는 일단 GET으로
    public void logoutMainGET(HttpServletRequest request) throws Exception {

        log.info("로그아웃 메소드 진입");

    }

    // 유저 쇼핑백 페이지 로드
    @GetMapping("/shoppingbag")
    public String userShoppingBag(
            @RequestParam("mid") String mid, Model model) {

        List<MemberSbagDTOForJsp> list = memberservice.getMemberShoppingBag(mid);
        model.addAttribute("shoppingbagList", list);

        return "member/shoppingbag";
    }


    // 장바구니 담기
    @PostMapping("/insertShoppingbag")
    @PreAuthorize("isAuthenticated()")
    @ResponseBody // 이거 안하면 return값을 jsp 찾으라는걸로 인식함
    public String insertShoppingbag(HttpServletRequest request, @RequestBody MemberSbagDTO msVO) throws Exception {

        HttpSession session = request.getSession(); // 세션
        System.out.println(msVO);
        // jsp에서 name에 입력된 값 vo에 저장
//		msVO.setMid(request.getParameter("mid"));
//		msVO.setPid(request.getParameter("pid"));
//		msVO.setPsize(request.getParameter("psize"));
//		msVO.setPcolor(request.getParameter("pcolor"));
//		msVO.setPamount(Integer.parseInt(request.getParameter("pamount")));

        // 장바구니 담기 실시
        int select = memberservice.selectShoppingBag(msVO);

        if (select > 0) {
            log.info("이미 장바구니에 존재합니다");
            return "fail:-1";
        }

        // 장바구니 담기 실시
        memberservice.insertShoppingBags(msVO);

        // 바뀐 장바구니 갯수 !
        int count = memberservice.getShoppingBagCount((String) session.getAttribute("member"));

        session.setAttribute("sbCount", count);// 바뀐 장바구니 갯수 다시 세서 가져오기

        return "success:" + count;

    }

    // 장바구니 변경
    @PostMapping("/updateShoppingBag")
    @ResponseBody
    public String updateShoppingBag(HttpServletRequest request, MemberSbagDTO msVO) throws Exception {


        // jsp에서 name에 입력된 값 vo에 저장
        msVO.setMid(request.getParameter("mid"));    // 접속한 유저 id
        msVO.setPid(request.getParameter("pid"));    // 선택된 프로덕트 id
        msVO.setPsize(request.getParameter("psize"));    // 바꿀 사이즈 name
        msVO.setPcolor(request.getParameter("pcolor"));    // 바꿀 컬러 name
        msVO.setPamount(Integer.parseInt(request.getParameter("pamount")));    // 바꿀 수량 name

        int cnt = memberservice.updateShoppingBag(msVO);
        if (cnt != 0) {
            log.info("장바구니 변경 성공!");
        } else {
            log.info("장바구니 변경 실패!");
        }

        return "member/shoppingbag";
    }


    //   @PostMapping("/deleteShoppingBag")
    @RequestMapping(value = "/deleteShoppingBag", produces = "application/json")
    public ResponseEntity<Void> deleteShoppingBag(HttpServletRequest request,
                                                  @RequestBody List<MemberSbagDTO> parameters) throws Exception {
        log.info("장바구니 삭제 진입!");
        HttpSession session = request.getSession(); // 세션

        // 장바구니 지우기 실시
        int cnt = memberservice.deleteShoppingBag(parameters);

        if (cnt != 0) {
            log.info("장바구니 삭제 성공!");
            session.setAttribute("sbCount",
                    memberservice.getShoppingBagCount((String) session.getAttribute("member")));// 바뀐 장바구니 갯수 다시 세서 가져오기
        } else {
            log.info("장바구니 삭제 실패!");
        }


        return new ResponseEntity<Void>(HttpStatus.OK);//객체로 받았기 때문에 똑같이 객체로 돌려줘야하기 때문
    }


    // 마이 페이지 진입
    @GetMapping("/mypage")
    public String mypageForm(HttpServletRequest request, Model model, Principal principal) {

        String username = principal.getName();
        //회원이 주문한 주문번호를 가져온다.
        OrderUserVO ouv = orderservice.getRecentOrderUserVO(username);


        //ouvl이 비어있다는 것을 알리기 위함
        if (ouv == null) {
            model.addAttribute("recentouv", null);
        } else {
            //해당하는 주문번호리스트를 model을 통해 넘겨준다.
            model.addAttribute("recentouv", ouv);
        }

        //회원의 마일리지를 담는다.
        model.addAttribute("totalMilege", orderservice.SumMilege(username));

        //회원의 정보를 가져온다.
        model.addAttribute("memberinfo", memberservice.getMember(username));

        //회원의 쿠폰 개수를 가져온다
        model.addAttribute("couponCount", orderservice.getCouponCount(username));

        //회원의 리뷰 개수를 가져오게 설정
        model.addAttribute("reviewCount", reviewsservice.UserReviewCount(username));


        String memberID = username;
        if (memberID == null) { //세션에 id가 없으면 로그인이 안되었기에 홈으로 보냄

            request.setAttribute("url", "home");
            return "home";
        } else { //로그인 상태이기에 마이페이지로 보냄
            log.info("마이페이지");

            return "member/mypage";
        }
    }

    //기존 정보가져오기
    @GetMapping("/updateuser")
    public String updateuser(HttpServletRequest request, Model model) {
        log.info("마이페이지");
        String memberID = (String) request.getSession().getAttribute("member");   //session값을 가져오고 getattribute해줌
        model.addAttribute("member", memberservice.getMember(memberID));   //해당세션에 있는 id값이랑 일치하는 member컬럼을 모두 가져와 member변수에 저장
        System.out.println(memberID);
        System.out.println(model);
        return "member/updateuser";
    }

    //회원 탈퇴
    @GetMapping("/deleteuser")
    public String deleteuser(HttpServletRequest request) {
        log.info("회원 탈퇴");

        return "member/deleteuser"; //회원 탈퇴페이지로 이동
    }

    // 비밀번호 체크
    @GetMapping("/pwcheck")
    public String pwcheck(HttpServletRequest request, Model model) {
        log.info("비밀번호체크");
        String memberID = (String) request.getSession().getAttribute("member"); // session값을 가져와서 id에 저장
        model.addAttribute("member", memberservice.getMember(memberID)); // member다 가져오기

        return "/member/pwcheck";
    }

    // 비밀번호 체크 로직
    @RequestMapping(value = "/pwcheckpro", method = RequestMethod.GET)
    public String pwcheckpro(MemberVO member, HttpServletRequest request) throws Exception {

        HttpSession session = request.getSession(); //세션정의

        String username = request.getParameter("j_username");
        System.out.println(username);

        MemberVO vo = memberservice.pwcheck(username);

        String inputpw = request.getParameter("j_password");
        String dbpw = vo.getMpassword();
        System.out.println(inputpw);
        System.out.println(dbpw);
        System.out.println("여기까지는 옴?");

        //값비교하는 로직
        boolean a = pwencoder.matches(inputpw, dbpw);
        System.out.println(a);

        if (a == true) {
            return "redirect:/member/updateuser";
        } else {
            return "redirect:/member/pwcheck";
        }
    }

    // 회원 탈퇴 로직
    @RequestMapping(value = "/deleteuserpro", method = RequestMethod.POST)
    public String deleteuserpro(HttpServletRequest request, RedirectAttributes redirectAttr,
                                SessionStatus sessionStatus) throws Exception {
        HttpSession session = request.getSession(); // 세션
        String memberID = (String) request.getSession().getAttribute("member"); // 세션 id가져오기
        System.out.println("memberID : " + memberID);

        String UserName = memberservice.getMemberAuth(memberID);
        log.info("UserName 반환 값 : " + UserName);
        if (UserName != "" || UserName != null) {
            memberservice.deleteuserAuth(UserName);
            memberservice.deleteuser(memberID);
            redirectAttr.addFlashAttribute("msg", "성공적으로 회원정보를 삭제했습니다.");
            SecurityContextHolder.clearContext();


            log.info("탈퇴성공");

            return "redirect:/member/loginForm";
        } else {
            log.info("탈퇴 실패");
            return "redirect:/";
        }


//      memberservice.deletemember_authorities(memberID);
//      memberservice.deleteuser(memberID); 
        /* session.invalidate(); */
    }


    //개인정보 업데이트
    @RequestMapping(value = "/updateuserpro", method = RequestMethod.GET)
    public String updatepassword(MemberVO member, HttpServletRequest request) throws Exception {

        HttpSession session = request.getSession(); // 세션

        String memberID = (String) request.getSession().getAttribute("member"); //세션에서 id가져오기
        String pass = request.getParameter("resultpw1"); //입력받은 비밀번호
        String oldpass = request.getParameter("resultpw"); //원래 비밀번호
        String resultpass = "";
        System.out.println(pass);
        System.out.println(oldpass);
        if (pass == null || pass == "" || pass == " ") {
            resultpass = oldpass;
        } else {
            resultpass = pwencoder.encode(pass);
        }


        member.setMid(memberID);
        member.setMpassword(resultpass); //memeber객체에 값넣어주기
        member.setMemail(request.getParameter("emailtotal"));
        member.setMname(request.getParameter("name"));
        member.setMtel((request.getParameter("tel")));
        System.out.println("값들어가는거 됌?");

        System.out.println(member);

        System.out.println(resultpass);
        System.out.println(member);
        memberservice.updateuser(member); // 유저정보 업데이트
        return "redirect:/";
    }

    // 위시리스트 페이지 진입
    @GetMapping("/wishList")
    public String wishList(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession(); // 세션
        String mid = (String) session.getAttribute("member");

        MemberWishListDTO dto = new MemberWishListDTO();
        dto.setMember_mid(mid);
        List<MemberWishListDTOforJsp> list = memberservice.getUsersWishList(dto);


        log.info("list---------------------" + list);

        model.addAttribute("wishList", list);

        return "member/wishList";
    }


    // 위시리스트 담기
    @PostMapping("/insertWishList")
    @ResponseBody// 이거 안하면 return값을 jsp 찾으라는걸로 인식함
    public String insertWishList(HttpServletRequest request, @RequestBody MemberWishListDTO wsDTO) throws Exception {
        //좋아요 눌르거나 위시리스트 등록버튼 눌렀을때 위시리스트에 넣어버려 !!
        HttpSession session = request.getSession(); // 세션

        log.info("wsDTO 결과 값 : " + wsDTO);
        log.info("pcolor 결과 값 : " + wsDTO.getPcolor());
        log.info("session 결과 값 : " + session);

        int cnt = 0;
        //이미 위시리스트에 담아논 적이 없다면!
        if (memberservice.isinWishList(wsDTO) < 1) {
            cnt = memberservice.insertWishList(wsDTO);
            if (cnt > 0) {
                session.setAttribute("wsCount", //위시리스트 잘 담았으면 갯수 세서 리턴
                        memberservice.getWishListCount(wsDTO.getMember_mid()));
                return "success:" + cnt;
            }
        }
        return "fail:" + cnt;
    }

    // 위시리스트 삭제
    @RequestMapping(value = "/deleteWishList", produces = "application/json")
    public ResponseEntity<String> deleteWishListItem(
            HttpServletRequest request,
            @RequestBody List<MemberWishListDTO> deleteList) throws Exception {
        //좋아요 눌르거나 위시리스트 등록버튼 눌렀을때 위시리스트에 넣어버려 !!
        HttpSession session = request.getSession(); // 세션
        log.info("deleteList ---------------" + deleteList.toString());
        ResponseEntity<String> result = null;

        for (MemberWishListDTO d : deleteList) {
            log.info("d --------------" + d);
        }
        int cnt = memberservice.deleteWishListItem(deleteList);

        result = ResponseEntity.status(HttpStatus.OK).body("1");//삭제 안됬으면 고대로 1 돌려줘야지

        if (cnt > 0) {//성공
            result = ResponseEntity.status(HttpStatus.OK).body("0"); //객체로 받았기 때문에 똑같이 객체로 돌려줘야하고 거기에 값을 ""넣어줘서 다시 삭제가 안되도록
            session.setAttribute("wsCount", //위시리스트 잘 삭제헸으면 갯수 세서 리턴
                    memberservice.getWishListCount((String) session.getAttribute("member")));
        }


        return result;

    }

    // 회원 등급 페이지 진입
    @GetMapping("/myGradeInfo")
    public String myGradeInfoForm() {
        return "member/myGradeInfo";
    }


    //주문조회로 이동
    @GetMapping("/orderlist")
    public void orderlist(Principal principal, Model model) {
        String username = principal.getName();
        //회원이 주문한 주문번호를 가져온다.
        List<OrderUserVO> ouvl = orderservice.getOrderUserVO(username);

        //ouvl이 비어있다는 것을 알리기 위함
        if (ouvl.isEmpty()) {
            model.addAttribute("ouvl", null);
        } else {
            //해당하는 주문번호리스트를 model을 통해 넘겨준다.
            model.addAttribute("ouvl", ouvl);
        }
    }

    @GetMapping("/deliveryManage")
    public void deliveryManage(String mid, Model model) {
        List<AddressVO> addrlist = memberservice.getAddressList(mid);
        model.addAttribute("addrlist", addrlist);
    }


	//마이페이지 내 리뷰 보기 이동
	@GetMapping("/reviewList")
	public void reviewList(Principal principal,Model model) {
		  String username = principal.getName();
		  //회원이 주문한 주문번호를 가져온다.
		  List<OrderUserVO> ouvl=orderservice.getOrderUserVO(username);
		  
		  //ouvl이 비어있다는 것을 알리기 위함
		  if(ouvl.isEmpty()) {
			  model.addAttribute("ouvl", null);
		  }else {
		  //해당하는 주문번호리스트를 model을 통해 넘겨준다.
		  model.addAttribute("ouvl", ouvl);
		  }
		  
		  
	}
    
    
	//리뷰 작성 이동
	@RequestMapping(value="/reviewWrite", method=RequestMethod.POST)
	public void reviewWrite(
			String oid,
			String pid,
			String ccolorcode, 
			String bname, 
			String pname, 
			String cname,
			String size,
			String thumbnail,
			HttpServletRequest request, Model model) {
		
		ProductVO product = productservice.getProduct(pid);
		model.addAttribute("productVO", product);
		model.addAttribute("oid", oid);
		model.addAttribute("pid", pid);
		model.addAttribute("ccolorcode", ccolorcode);
		model.addAttribute("bname", bname);
		model.addAttribute("pname", pname);
		model.addAttribute("cname", cname);
		model.addAttribute("size", size);
		model.addAttribute("thumbnail", thumbnail);
	}
	
	@RequestMapping(value="/review", method=RequestMethod.POST)
	public void review(String oid, String ccolorcode,HttpServletRequest request, Model model) throws Exception{
		log.info("oid : " + oid + "ccolorcode : " + ccolorcode);
		ReviewsDTO review = reviewsservice.getReview(oid, ccolorcode);
		ObjectMapper objectMapper = new ObjectMapper();
		Map<String, Object> rcontent = objectMapper.readValue(review.getRcontent(),new TypeReference<Map<String,Object>>(){});
		review.setRcontentMap(rcontent);
		
		ProductVO product = productservice.getProduct(review.getPid());
		log.info("Cmedium : " + product.getCmedium());
		//log.info(review.toString());
		model.addAttribute("review", review);
		model.addAttribute("productVO", product);
	}
	
	//상품평 작성하기
	@ResponseBody
	@RequestMapping(value="/reviewWriteOk", method=RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public String reviewWriteOk(@RequestBody ReviewsVO review, HttpServletRequest request) throws Exception{
		String mid = orderservice.getOrderUserItem(review.getOid()).getMid();
		review.setMid(mid);
	    //ObjectMapper objectMapper = new ObjectMapper();
	    //Map<String, Object> rcontent = objectMapper.readValue(review.getRcontent(),new TypeReference<Map<String,Object>>(){});
		//OrderItemVO orderItem = orderservice.getOrderItemProductInfo((String)rcontent.get("oid"));
		reviewsservice.reviewsInsert(review);
		//넣고 다시 리스트 반환
		
		
		return "OK";
	}
		
	//uploadFile 이름 버그 주의
		@PostMapping("/uploadAjaxAction")
		public ResponseEntity<ReviewAttachFileDTO> uploadAjaxPost(
				String pid,
				MultipartFile[] uploadFile) throws IOException {

			String uploadFolder = "C:\\Users\\kosa\\Desktop\\Intellij Final\\Hyundai_Final_Project\\thehandsomeProject\\src\\main\\webapp\\resources\\review_images";			

			log.info(uploadFile);
			log.info(uploadFile.length);
			//제품ID로 폴더 생성
			File uploadPath = new File(uploadFolder,pid);
			log.info("uploadPath" + uploadPath);
			if( uploadPath.exists() == false) { //제품 폴더 없으면 새로만들기
				uploadPath.mkdirs();
			}//end if
			
			//정보저장 객체 생성
			ReviewAttachFileDTO attachDTO = new ReviewAttachFileDTO();
			List<String> list = new ArrayList<String>();
			
			int index = 0;
			for (MultipartFile multipartFile : uploadFile) {
				log.info("-------------------------------------");
				log.info("Upload File Name: " + multipartFile.getOriginalFilename());
				log.info("Upload File Size: " + multipartFile.getSize());

				String uploadFileName = multipartFile.getOriginalFilename();
			
				//attachDTO.setFileName(uploadFileName); //정보저장 객체 생성
				
				UUID uuid = UUID.randomUUID();// java.util의 이름중복을 알아서 피하게해주는 라이브러리 사용
				uploadFileName = pid + "_" + uuid.toString()+ "_" + uploadFileName;	
				String uploadFileThubmNailName = "s_"+uploadFileName;//썸네일 이미지
				
				attachDTO.setUuid(uuid.toString()); //정보저장 객체 생성
				
				list.add("/resources/review_images/"+pid+"/"+uploadFileName);//그냥 이미지들 경로 추가
				//파일 저장 위치 변경
				File saveFile = new File(uploadPath, uploadFileName);
				
				try {
					multipartFile.transferTo(saveFile);// 파일저장
					//이미지 파일이면 썸네일 생성 추가
					if( ReviewUtil.builder().build().checkImageType(saveFile) && index < 1 ) {
						FileOutputStream thumnail =  //파일생성
							new FileOutputStream(new File(uploadPath, uploadFileThubmNailName));
						Thumbnailator.createThumbnail( //썸내일 생성
								multipartFile.getInputStream(),thumnail, 60, 60);
						thumnail.close(); //파일 닫기
						attachDTO.setThumbPath("/resources/review_images/"+pid+"/"+uploadFileThubmNailName);//썸네일 이미지 경로
					}//end if
				} catch (Exception e) {
					log.error(e.getMessage());
				} // end catch
				
				index++;
				
			} // end for
			attachDTO.setImagesPath(list);
			
			return new ResponseEntity<>(attachDTO, HttpStatus.OK);

		}//end uploadAJXpost...

		@GetMapping("/uploadAjax")
		public void uploadAjax() {
			log.info("upload Ajax....");
			
		}//end uploadAj...
		
		@GetMapping("/uploadForm")
		public void uploadForm() {

			log.info("upload form");
		}//end upload....

		
		//uploadFile 이름 버그 주의
		@PostMapping("/uploadFormAction")
		public void uploadFormPost(MultipartFile[] uploadFile, Model model) {

			//컴퓨터마다 환경이다르므로 바꿔줘야해 !
			String uploadFolder = "C:\\Users\\kosa\\Desktop\\Intellij Final\\Hyundai_Final_Project\\thehandsomeProject\\src\\main\\webapp\\resources\\review_images";

			log.info(uploadFile);
			log.info(uploadFile.length);

			//파일들로 인자를 받아서 for문을 돌면서 이름과, 사이즈를 log찍고 저장!
			for (MultipartFile multipartFile : uploadFile) {

				log.info("-------------------------------------");
				log.info("Upload File Name: " + multipartFile.getOriginalFilename());
				log.info("Upload File Size: " + multipartFile.getSize());

				File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());

				try {
					multipartFile.transferTo(saveFile);//MultipartFile의 내장 함수로 파일을 실제 하드에 저장!
				} catch (Exception e) {
					log.error(e.getMessage());
				} // end catch
			} // end for

		}//end uploadpost...
		
		
		@RequestMapping(value = "/reviewCancle", produces = "application/json")
		public ResponseEntity<Void> reviewCancle(
				@RequestBody ReviewAttachFileDTO attachDTO){
			
			String deletePath = "C:\\Users\\kosa\\Desktop\\Intellij Final\\Hyundai_Final_Project\\thehandsomeProject\\src\\main\\webapp\\resources\\review_images";
			
			ReviewUtil.builder().build().deleteCancleImage(deletePath+attachDTO.getThumbPath());
			
			for(String imgpath : attachDTO.getImagesPath()) {
				ReviewUtil.builder().build().deleteCancleImage(deletePath+imgpath);
			}
			
			return new ResponseEntity<Void>(HttpStatus.OK);
		}
			
	
}

