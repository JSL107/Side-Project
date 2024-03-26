package com.tohome.controller.action;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

import com.tohome.dao.BasketDAO;
import com.tohome.dao.MemberDAO;
import com.tohome.dto.MemberDTO;

//Written  by 여명, 승준
public class LoginAction implements Action{
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String url="member/login_fail.jsp";// 로그인 실패시 보낼 url
        HttpSession session =request.getSession();//jsp에서는 바로 session쓸 수 있는데 java에서는 생성하고 써야함

        // 로그인 폼으로부터 받은 아이디와 패스워드
        String userId = request.getParameter("user_id");
        String userPwd = request.getParameter("user_pw");

        // 회원 테이블 DAO를 통해 회원 정보 DTO 획득
        MemberDAO dao = MemberDAO.getInstance();//static으로 선언해서 바로 가져오기 가능
        MemberDTO memberDTO = dao.getLoginMemberDTO(userId, userPwd);
        
        // 회원의 장바구니 DAO를 통해 회원 장바구니에 담긴 갯수 획득
        BasketDAO bdao =  BasketDAO.getInstance();
        int basketCount = bdao.CountBasketItem(memberDTO.getUser_no()); 
        
        // 로그인 성공 여부에 따른 처리
        if (memberDTO.getUser_id() != null) {
            // 로그인 성공시 세션에 유저의 id, 번호, 이름, 장바구니 담은 갯수 담기
            session.setAttribute("UserId", memberDTO.getUser_id());
            session.setAttribute("UserName", memberDTO.getUser_name());
            session.setAttribute("UserNo", memberDTO.getUser_no());
            session.setAttribute("basketCount", basketCount);
            url = "TohomeServlet?command=main";// 로그인 성공시 메인 화면으로 보내기
        }
        else {
            // 로그인 실패
            request.setAttribute("LoginErrMsg", "로그인 오류입니다.");
        }
        System.out.println(url);
        request.getRequestDispatcher(url).forward(request, response);
    }
}
