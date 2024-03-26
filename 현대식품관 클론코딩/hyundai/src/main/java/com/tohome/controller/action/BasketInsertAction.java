package com.tohome.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tohome.dao.*;
import com.tohome.dto.MemberDTO;
import com.tohome.dto.ProductDTO;

//Written  by 여명, 승준
public class BasketInsertAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
        String url = "TohomeServlet?command=product_detail&prod_no=";
        
        HttpSession session =request.getSession();
        
        // 제품아이디랑 수량을 받아서 장바구니 detail table에 저장해야해
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		int prodNo = Integer.parseInt(request.getParameter("prodNo"));
		int prodQuant = Integer.parseInt(request.getParameter("prodQuant"));
		
		//장바구니 버튼을 눌렀을때 이 서블렛이 실행되는데 똑같은 제품설명 페이지로 가고싶어서 url에 prod_no을 붙임
		url += prodNo;

		BasketDAO basketDAO = BasketDAO.getInstance();
		//DB에 해당 물건을 담기위해서 prodNO, prodQuant(수량)을 인자로 넘겨줌 그리고 장바구니에 담긴 갯수를 result로 받음
        int result = basketDAO.InsertBasket(userNo, prodNo, prodQuant);
        
        
        request.setAttribute("basketInsertYN", result);
        //session에 장바구니 갯수를 넣어줌
        session.setAttribute("basketCount", result);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher(url);
        dispatcher.forward(request, response);
	}

}
