package com.tohome.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tohome.dao.*;
import com.tohome.dto.BasketDTO;
public class BasketPageAction implements Action{
	//Written  by 미림, 여명, 승준, 준석
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "member/basket.jsp";
		
		//장바구니에 담긴놈 다 가져오기는데 user_no(basket_detail에 user_no로 인덱스 만들어놓음)로 가저옴
		//필요한 정보 user의 할인률, 제품들의 정보(img, 제품이름), 장바구니에 담긴 갯수
		
		HttpSession session =request.getSession();
		
		//세션에 UserNo이 없는건 로그인되지 않은 상태이므로 로그인 페이지로 이동
		if (session.getAttribute("UserNo")==null) {
			url="member/login_form.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(url);
			dispatcher.forward(request, response);
		}
		
		//세션의 UserNo을 가져와서 저장
		int userNo = (int)session.getAttribute("UserNo");
		BasketDAO basketDAO = BasketDAO.getInstance();
		
		// ImportUsersBasket에 userNo을 인자로 주어서 DB에서 유저장바구니에 담긴 물건을 basketList에 담음
		ArrayList<BasketDTO> basketList = basketDAO.ImportUsersBasket(userNo);
		
		request.setAttribute("basketList", basketList);// 위에서 받은 장바구니 목록들을 request에 담음
		
		//장바구니에 담긴게 한개 이상이면 해당 유저의 할인률을 같이 request에 담아 보냄 
		if(basketList.size() > 0) {
			request.setAttribute("saleRate", basketList.get(0).getSale_rate());
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);   
	}

}
