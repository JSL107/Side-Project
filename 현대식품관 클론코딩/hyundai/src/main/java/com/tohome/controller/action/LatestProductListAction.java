package com.tohome.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tohome.dao.ProductDAO;
import com.tohome.dto.ProductDTO;

public class LatestProductListAction implements Action{
	
	//Written  by 여명, 승준
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		String url="product/latest_page.jsp";
		
		
		
		ProductDAO productDAO=ProductDAO.getInstance();// ProductDAO 인스턴스 가져옴
		int topnum = Integer.parseInt(request.getParameter("top_num")); // request로 받은 topnum값을 변수에 저장
		int filter = Integer.parseInt(request.getParameter("filter")); // request로 받은 filter 타입 값을 변수에 저장
		
		//LatestProductList함수에 위에 값을 인자로 넣어서 얻은 최신물건목록을 latestProductList에 저장
		ArrayList<ProductDTO> latestProductList = productDAO.LatestProductList(topnum,filter);
		
		// request에 latestProductList를 담음
		request.setAttribute("latestProductList", latestProductList);
		RequestDispatcher dispatcher = request
				.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}


}