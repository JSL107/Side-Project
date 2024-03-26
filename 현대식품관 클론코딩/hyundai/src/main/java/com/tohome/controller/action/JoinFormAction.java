package com.tohome.controller.action;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

//Written  by 여명
public class JoinFormAction implements Action{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //회원가입 버튼 눌리면 회원가입페이지로 이동시키기
        String url = "member/join.jsp";
        request.getRequestDispatcher(url).forward(request, response);
    }
}
