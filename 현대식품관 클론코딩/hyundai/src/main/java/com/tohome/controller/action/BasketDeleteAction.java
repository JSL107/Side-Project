package com.tohome.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tohome.dao.*;

//Written  by 여명, 승준
public class BasketDeleteAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String url = "TohomeServlet?command=basket";
        HttpSession session =request.getSession();
        
        int userNo = (int)session.getAttribute("UserNo");
        // 장바구니에서 없앨 prod_no(들)을 하나의 문자열로 jsp에서 보내주었는데 그걸 양쪽 공백 제거 후 pNums에 담음
        String pNums = request.getParameter("pNums").trim();
        
        BasketDAO basketDAO = BasketDAO.getInstance();
        
        // basketDelete 함수에 pNums를 인자로 주어서 유저 장바구니에 목록을 삭제후 현 장바구니 갯수를 반환받아 session에 담음
        session.setAttribute("basketCount",basketDAO.basketDelete(userNo, pNums));
       
        RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);

	}

}
