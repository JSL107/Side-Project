package com.hdsm.security;

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

import com.hdsm.domain.MemberVO;
import com.hdsm.persistence.MemberMapper;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

    @Autowired
    private MemberMapper membermapper;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth)
            throws IOException, ServletException {
        String url = request.getParameter("referer");
        System.out.println("url : " + url);
        int check = 0;
        String arr[] = new String[1000];
        String urlsp[] = url.split("/"); //url 자르기
        for (int i = 0; i < urlsp.length; i++) {
            System.out.println("이건뭐임 대체 : " + urlsp[i]);
            if (urlsp[i].equals("logout")) {
                check = 1;
            } else if (urlsp[i].equals("login") || urlsp[i].equals("loginForm")) {
                check = 2;
            } else if (urlsp[i].equals("loginForm?error") || urlsp[i].equals("loginForm?logout") || urlsp[i].equals("join")) {
                check = 3;
            }
        }
        System.out.println("check : " + check);

        String username = auth.getName();
        log.warn(username + "님 Login Success");

        List<String> roleNames = new ArrayList<>();

        auth.getAuthorities().forEach(authority -> {

            roleNames.add(authority.getAuthority());

        });//end auth.getAuthorities

        log.warn("ROLE NAMES: " + roleNames);

        HttpSession session = request.getSession(); // 세션
        session.setAttribute("member", username);
        MemberVO vo = membermapper.read(username);
        session.setAttribute("mname", vo.getMname());
        if (vo != null) {
            int wscount = membermapper.getWishListCount(username);
            int sbcount = membermapper.getShoppingBagCount(username);

            session.setAttribute("wsCount", wscount);
            session.setAttribute("sbCount", sbcount);
            log.warn("--------------------" + sbcount);
        }

        if (roleNames.contains("ROLE_ADMIN")) {
            response.sendRedirect("/");
            return;
        }//end if

        if (roleNames.contains("ROLE_MEMBER")) {
            response.sendRedirect("/");
            return;
        }//end if

        if (check == 1) {
            response.sendRedirect("/");
        } else if (check == 2) {
            response.sendRedirect("/");
        } else if (check == 3) {
            response.sendRedirect("/");
        } else {
            response.sendRedirect(url);
        }


    }//endonAuthenticationSuccess
}//end class