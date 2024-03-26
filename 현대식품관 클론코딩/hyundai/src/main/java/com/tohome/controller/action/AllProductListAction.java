package com.tohome.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tohome.dao.ProductDAO;
import com.tohome.dto.ProductDTO;

//Written by 여명, 승준
public class AllProductListAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "product/best.jsp";

		//request에서 filter 타입과 top_num을 가져와 각각 변수에 할당
		int filter = Integer.parseInt(request.getParameter("filter"));
		int topnum = Integer.parseInt(request.getParameter("top_num"));
		
		ProductDAO productDAO = ProductDAO.getInstance();
		//getAllproductList에 request에서 받아온 값들을 인자로 줘서 물건 리스트를 넘겨줌
		ArrayList<ProductDTO> AllProductList = productDAO.getAllProductList(topnum, filter);

		//물건 리스트를 bestProductList라는 이름으로 reqeust에 담음
		request.setAttribute("bestProductList", AllProductList);
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
	
}

