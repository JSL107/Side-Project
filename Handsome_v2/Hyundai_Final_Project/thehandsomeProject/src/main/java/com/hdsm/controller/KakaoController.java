package com.hdsm.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.hdsm.domain.MemberAuthVO;
import com.hdsm.domain.MemberVO;
import com.hdsm.security.CustomUserDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.hdsm.domain.KakaoUserDTO;
import com.hdsm.persistence.MemberMapper;
import com.hdsm.service.KakaoMemberService;
import com.hdsm.service.KakaoService;
import com.hdsm.service.MemberService;

import lombok.extern.log4j.Log4j;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
@Log4j
public class KakaoController {

    @Autowired
    private KakaoService ks;

    @Autowired
    private MemberService ms;

    @Autowired
    MemberMapper mapper;

    @Autowired
    CustomUserDetailsService customdetailsservice;

    //    [GET] 카카오 로그인 후 redirect
    @GetMapping("/kakao/login")
    private String login(@RequestParam String code, HttpSession session, HttpServletRequest request, Model model) {
        String access_Token = ks.getAccessToken(code);
        HashMap<String, Object> userInfo = ks.getUserInfo(access_Token);
        String nickname = (String) userInfo.get("nickname");
        String email = (String) userInfo.get("email");
        String id = (String) userInfo.get("kakao_id");
        System.out.println("kakao email은 " + email);
        int hasEmail = ms.checkEmail(email);
        System.out.println("hasEmail : " + hasEmail);
        String[] emailId = email.split("@");
        model.addAttribute("nickname", nickname);
        model.addAttribute("emailId", emailId[0]);
        model.addAttribute("emailDot", emailId[1]);
        model.addAttribute("kakao_id", id);
        model.addAttribute("email", email);

        session = request.getSession();
        session.setAttribute("kakaoToken", access_Token);

        if (hasEmail == 0) {
            return "/kakao/joinForm";
        } else {
            System.out.println("로그인 성공");
            session.setAttribute("member", email);
            session.setAttribute("mname", nickname);

            String name = (String) session.getAttribute("member");
            System.out.println(name);

            return "/home";
        }
    }

    @GetMapping("/kakao/logout")
    private String logout(HttpSession session) throws IOException {
        if (((String) session.getAttribute("kakaoToken")) != (null)) {
            ks.getLogout((String) session.getAttribute("kakaoToken"));
            session.invalidate();
        } else {
            System.out.println("로그 아웃 후 토큰 : " + (String) session.getAttribute("kakaoToken"));
        }

        return "redirect:../";
    }

    @GetMapping("/kakao/joinForm")
    public String joinForm() {
        log.info("(카카오)회원가입 페이지 왔다");
        return "member/joinForm";
    }

    public int changeDateInteger(String date1) {
        return Integer.parseInt(date1);
    }

    @PostMapping("/kakao/signup")
    private String signup(MemberVO member, HttpServletRequest request, HttpSession session) throws Exception {
        String access_Token = (String) session.getAttribute("kakaoToken");
        HashMap<String, Object> userInfo = ks.getUserInfo(access_Token);
        String age = request.getParameter("age");
        SimpleDateFormat format;
        format = new SimpleDateFormat("yyyy");
        String today_yy = format.format(new Date());
        String yy = age.substring(0, 4);
        if (changeDateInteger(today_yy) <= changeDateInteger(yy) && changeDateInteger(yy) <= 1500) {
            return "/false";
        } else {
            String mm = age.substring(4, 6);
            if (changeDateInteger(mm) <= 1 && changeDateInteger(mm) >= 12) {
                return "/false";
            } else {
                String dd = age.substring(6, 8);
                if (changeDateInteger(dd) >= 31 && changeDateInteger(dd) <= 1) {
                    return "/false";
                } else {
                    member.setMid((String) userInfo.get("kakao_id"));
                    member.setMpassword("12341234");
                    member.setMname((String) userInfo.get("nickname"));
                    member.setMemail((String) userInfo.get("email"));
                    member.setMtel(request.getParameter("custTel"));
                    member.setMaddress1(request.getParameter("partner.postNo"));
                    member.setMaddress2(request.getParameter("partner.addr1"));
                    member.setMzipcode(Integer.parseInt(request.getParameter("zonecode")));
                    member.setAge(changeDateInteger(today_yy) - (changeDateInteger(yy)));
                    member.setGender((String) request.getParameter("gender"));
                    member.setMstatus("KAKAO");

                    MemberAuthVO mavo = new MemberAuthVO();
                    mavo.setUsername((String) userInfo.get("kakao_id"));
                    mavo.setAuthority("ROLE_USER");

                    // 회원 가입 실행
                    ms.insertMember(member);
                    mapper.insertMemberAutority(mavo);

                    return "member/joinResult";
                }
            }
        }
    }
}
