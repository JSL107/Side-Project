package com.tohome.controller.action;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

//Written  by 여명
public class LogoutAction implements Action{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "TohomeServlet?command=main";

        //session이 존재하면 반환하고 존재하지 않으면 session 새로 생성 안하고 그냥 null 반환
        HttpSession session=request.getSession(false);

        if(session!=null){
            //session이 있으면 모든 속성 한꺼번에 삭제(UserId, UserName, 장바구니갯수, user_no)
            session.invalidate();
        }

        request.getRequestDispatcher(url).forward(request, response);
    }
}
