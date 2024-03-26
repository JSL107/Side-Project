package com.tohome.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tohome.dao.ProductDAO;
import com.tohome.dto.ProductDTO;

public class CategoryProductListAction implements Action{

	// Written by 승준
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url="product/category_page.jsp";
		
		//DAO에 있는 인스턴스를 받아옴
		ProductDAO productDAO=ProductDAO.getInstance();
		int cid = Integer.parseInt(request.getParameter("category_id"));// request에서 받아온 카테고리 아이디 받음
		int topnum = Integer.parseInt(request.getParameter("top_num"));// request에서 받아온 topnum 받음
		int filter = Integer.parseInt(request.getParameter("filter"));// request에서 받아온 filter type 받음
		
		//getCategoryProductList에 위에 request에서 받은 3개의 값을 인자로 넣어서
		// 카테고리, 필터타입대로 DB에서 받아온 물건 목록을 반환받아 categoryProductList에 담음
		ArrayList<ProductDTO> categoryProductList = productDAO.getCategoryProductList(cid, topnum, filter);
		
		request.setAttribute("categoryProductList", categoryProductList); //바로 위에 DB에서 가져온 물건 목록을 request에 담음
		request.setAttribute("categoryId", cid); // 카테고리 아이도 담음
		RequestDispatcher dispatcher = request
				.getRequestDispatcher(url);// 위에서 설정한 request 그대로 forwording시킴
		dispatcher.forward(request, response);
	}

}
