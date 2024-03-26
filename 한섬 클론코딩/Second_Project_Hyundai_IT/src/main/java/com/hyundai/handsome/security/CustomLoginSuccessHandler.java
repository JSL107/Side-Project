package com.hyundai.handsome.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.hyundai.handsome.mapper.CartMapper;
import com.hyundai.handsome.mapper.MemberMapper;
import com.hyundai.handsome.vo.MemberVO;

import lombok.extern.log4j.Log4j;

/**
 * @author 김찬중, 이준석
 * @since 2022.10.18
 * 
 *        <pre>
 * 수정일                     수정자                     수정내용
 * ----------     ----------       ---------------------------
 * 2022.10.18     김찬중, 이준석             최초 생성
 *        </pre>
 */

//로그인 성공시 동작하는 이벤트 핸들러
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

    @Autowired
    private MemberMapper membermapper;

    @Autowired
    private CartMapper cartmapper;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
            Authentication auth) throws IOException, ServletException {
        String username = auth.getName();
        List<String> roleNames = new ArrayList<>();

        // 계정의 권한 목록을 가져와서 리스트에 담는다
        auth.getAuthorities().forEach(authority -> {
            roleNames.add(authority.getAuthority());
        });

        HttpSession session = request.getSession(); // 세션
        MemberVO lvo = membermapper.memberLogin2(username);

        session.setAttribute("member", lvo);
        
        if (roleNames.contains("ROLE_ADMIN")) {
//            관리자로 접속 시 admin의 메인페이지로 접속
            response.sendRedirect("/admin/main");
            return;
        } else if (roleNames.contains("ROLE_MEMBER")) {
//            일반 회원이 접속 시 메인 페이지로 접속
            response.sendRedirect("/");
            return;
        }

//        모두 아닐 때 메인페이지로 접속
        response.sendRedirect("/");
    }

}
