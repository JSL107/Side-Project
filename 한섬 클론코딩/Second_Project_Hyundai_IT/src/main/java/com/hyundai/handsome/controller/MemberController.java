package com.hyundai.handsome.controller;

import java.security.Principal;
import java.util.List;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.hyundai.handsome.service.OrderService;
import com.hyundai.handsome.vo.MyPageOrderViewVO;
import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hyundai.handsome.service.CouponService;
import com.hyundai.handsome.service.MemberService;
import com.hyundai.handsome.vo.MemberVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/**
 * MemberController
 *
 * @author 김찬중, 이준석
 * @since 10.06
 *
 * <pre>
 * 수정일                 수정자                          수정내용
 * ----------  ---------------      ---------
 * 2022.10.06    이준석                          최초 생성
 * 2022.10.10	  김찬중			       회원가입&로그인 기능 구현
 * 2022.10.11	  김찬중				메일 인증 기능 작성
 * 2022.10.12       이준석				마이페이지 기능 작성
 * 2022.10.24    김찬중                          로그인 방식 security로 변경
 *        </pre>
 */

@AllArgsConstructor
@Controller
@RequestMapping(value = "/member")
public class MemberController {

    @Autowired
    private MemberService memberservice;

    @Autowired
    private CouponService couponService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private JavaMailSender mailSender;

    @Autowired
    private BCryptPasswordEncoder pwEncoder;

    // 회원가입 페이지 이동
    @RequestMapping(value = "joinstart", method = RequestMethod.GET)
    public void joinfirGET() {

    }

    // 회원가입fir
    @RequestMapping(value = "/joinstart", method = RequestMethod.POST)
    public String joinfirPOST() throws Exception {
        return "redirect:/member/join_sec";
    }

    // 회원가입 페이지 이동
    @RequestMapping(value = "join_sec", method = RequestMethod.GET)
    public void joinsecGET() {

    }

    // 회원가입sec
    @RequestMapping(value = "/join_sec", method = RequestMethod.POST)
    public String joinsecPOST() throws Exception {
        return "redirect:/member/join";
    }

    // 회원가입 페이지 이동
    @RequestMapping(value = "join", method = RequestMethod.GET)
    public void joinGET() {

    }

    // 회원가입
    @RequestMapping(value = "/join", method = RequestMethod.POST)
    public String joinPOST(MemberVO member) throws Exception {

        String rawPw = ""; // 인코딩 전 비밀번호
        String encodePw = ""; // 인코딩 후 비밀번호

        rawPw = member.getMpassword();// 비밀번호 데이터 얻음
        encodePw = pwEncoder.encode(rawPw); // 비밀번호 인코딩
        member.setMpassword(encodePw); // 인코딩된 비밀번호 member객체에 다시 저장

        /* 회원가입 쿼리 실행 */
        memberservice.memberJoin(member);

        return "redirect:/member/join_final";

    }

    // 회원가입 페이지 이동
    @RequestMapping(value = "join_final", method = RequestMethod.GET)
    public void joinfianlGET() {

    }

    // 회원가입final
    @RequestMapping(value = "/join_final", method = RequestMethod.POST)
    public String joinfinalPOST() throws Exception {
        return "redirect:/";
    }

    // 회원정보 수정 페이지 이동
    @RequestMapping(value = "updateMember", method = RequestMethod.GET)
    public void updateMemberGET(Principal prin, Model model) throws Exception {
        String mid = prin.getName();
        // MembeVO에 값 삽입
        MemberVO lvo = memberservice.memberLogin2(mid);
        model.addAttribute("member", memberservice.myPage(lvo.getMid()));

    }

    // 회원정보 수정
    @RequestMapping(value = "/updateMember", method = RequestMethod.POST)
    public String updateMemberPOST(HttpServletRequest request, MemberVO member) throws Exception {

        MemberVO lvo = (MemberVO) request.getSession().getAttribute("member");

        String rawPw = ""; // 인코딩 전 비밀번호
        String encodePw = ""; // 인코딩 후 비밀번호

        member.setMid(lvo.getMid());
        rawPw = member.getMpassword();// 비밀번호 데이터 얻음
        System.out.println(rawPw);
        encodePw = pwEncoder.encode(rawPw); // 비밀번호 인코딩
        lvo.setMpassword(encodePw); // 인코딩된 비밀번호 member객체에 다시 저장
        lvo.setMname(member.getMname());
        lvo.setMemail(member.getMemail());
        lvo.setMtel(member.getMtel());

        /* 회원가입 쿼리 실행 */
        memberservice.updateMember(lvo);

        return "redirect:/member/mypage";
    }

    /* 회원 정보 삭제 */
    @PostMapping("/deleteMember")
    public String deleteMemberPOST(HttpServletRequest request, Principal prin) throws Exception {
        // principal을 통해 mid 가져오기
        String mid = prin.getName();
        /* 회원탈퇴 쿼리 실행 */
        memberservice.deleteMember(mid);
        HttpSession session = request.getSession();
        session.invalidate();
        return "redirect:/";

    }

    // 로그인
    @GetMapping("/login")
    public void login(String error, String logout, Model model) {
        if (error != null) {
            model.addAttribute("error", "Login error");
        }
        if (logout != null) {
            model.addAttribute("logout", "Logout");
        }
    }

    // 아이디 찾기 페이지 이동
    @RequestMapping(value = "findID", method = RequestMethod.GET)
    public void findIDGET() {

    }

    // 아이디 중복 검사
    @RequestMapping(value = "/memberIdChk", method = RequestMethod.POST)
    @ResponseBody
    public String memberIdChkPOST(String mid) throws Exception {
        // logger.info("memberIdChk() 진입");

        int result = memberservice.idCheck(mid);

        if (result != 0) {

            return "fail"; // 중복 아이디가 존재

        } else {

            return "success"; // 중복 아이디 x

        }
    }

    /* 아이디 찾기 */
    @RequestMapping(value = "findID.do", method = RequestMethod.POST)
    public String findIDPOST(HttpServletRequest request, MemberVO member, RedirectAttributes rttr) throws Exception {

        HttpSession session = request.getSession();
        String name = "";
        String email = "";
        String mname = "";
        String memail = "";

        MemberVO lvo = memberservice.findID(member); // 제출한 이름과 일치하는 아이디 있는지

        if (lvo != null) { // 일치하는 아이디 존재시

            mname = member.getMname(); // 사용자가 제출한 이름
            System.out.println(mname);
            name = lvo.getMname(); // 데이터베이스에 저장된 이름
            System.out.println(name);

            memail = member.getMemail(); // 사용자가 제출한 이메일
            System.out.println(memail);
            email = lvo.getMemail(); // 데이터베이스에 저장한 이메일
            System.out.println(email);

            if (name.equals(mname) && email.equals(memail)) { // 일치여부 판단

                session.setAttribute("member", lvo); // session에 사용자의 정보 저장
                rttr.addFlashAttribute("result", 1);
                return "redirect:/member/findID"; // 메인페이지 이동

            } else {

                rttr.addFlashAttribute("result", 0);
                return "redirect:/member/findID"; // 로그인 페이지로 이동

            }

        } else { // 일치하는 아이디가 존재하지 않을 시 (로그인 실패)

            rttr.addFlashAttribute("result", 0);
            return "redirect:/member/findID"; // 로그인 페이지로 이동

        }
    }

    /* 이메일 인증 */
    @RequestMapping(value = "/mailCheck", method = RequestMethod.GET)
    @ResponseBody
    public String mailCheckGET(@RequestParam("email") String email) throws Exception {

        /* 인증번호(난수) 생성 */
        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111;

        /* 이메일 보내기 */
        String setFrom = "hdite1284@naver.com";
        String toMail = email;
        String title = "회원가입 인증 이메일 입니다.";
        String content = "홈페이지를 방문해주셔서 감사합니다." + "<br><br>" + "인증 번호는 " + checkNum + "입니다." + "<br>" + "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";

        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content, true);
            mailSender.send(message);

        } catch (Exception e) {
            e.printStackTrace();
        }
        String num = Integer.toString(checkNum);

        return num;
    }

    /* 로그아웃 */
    @RequestMapping(value = "/logout", method = RequestMethod.GET) // 받는 형태는 일단 GET으로
    public void logoutGET(HttpServletRequest request) throws Exception {
    }

    /* 마이페이지 접속 */
    @RequestMapping(value = "/mypage", method = RequestMethod.GET)
    public void myPage(HttpServletRequest request, Model model, Principal prin) throws Exception {
        // principal을 통해 mid 가져오기
        String mid = prin.getName();
        // MembeVO에 값 삽입
        List<MyPageOrderViewVO> orderList = orderService.selectOrderList(mid);
        model.addAttribute("member", memberservice.myPage(mid));
        model.addAttribute("coupon", couponService.getCouponCount(mid));
        model.addAttribute("orderview", orderList);
        System.out.println(orderService.selectOrderList(mid));

    }

    // qna 페이지 이동
    @RequestMapping(value = "qnaMain", method = RequestMethod.GET)
    public void qnaMainGET() {

    }
}
