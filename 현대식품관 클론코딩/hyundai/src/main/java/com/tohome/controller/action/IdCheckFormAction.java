package com.tohome.controller.action;

import com.tohome.dao.MemberDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class IdCheckFormAction implements Action{
	
	//Written by 승준
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "member/idcheck.jsp";

        // request에서 아이디 pram값을 가지고와서 양쪽 공백을 없애줌
        String id = request.getParameter("id").trim();

        MemberDAO dao = MemberDAO.getInstance();// 인스턴스 가져옴
        int message = dao.checkID(id); // checkID함수에 받아온 id값을 넣고 반환값을 message에 넣음

        request.setAttribute("message", message);// message에는 id가 있는지없는지 확인하는 값이므로 request에 message라는 이름으로 담음
        request.setAttribute("id", id); // 받아온 id를 다시 담음
        RequestDispatcher dispatcher = request.getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
}
