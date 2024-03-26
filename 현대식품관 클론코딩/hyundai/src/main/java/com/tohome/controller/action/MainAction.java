package com.tohome.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tohome.dao.ProductDAO;
import com.tohome.dto.ProductDTO;

//Written  by 여명, 승준
public class MainAction implements Action {
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/main.jsp";

		// 메인에서 신상품 4개만 보여주기 위해 table 내용을 다 가지고와서  4개만 가지고오기
		ProductDAO productDAO = ProductDAO.getInstance();
		int topnum = 0;
		int filter = 0;
		ArrayList<ProductDTO> latestProductList = productDAO.LatestProductList(topnum, filter);// topnum은 이제 의미없는 숫자이고 filter가 0인건 별다른 정렬없이 가져오겠다는 뜻
		ArrayList<ProductDTO> latest4Product = new ArrayList<ProductDTO>();
		latest4Product.add(latestProductList.get(0));
		latest4Product.add(latestProductList.get(1));
		latest4Product.add(latestProductList.get(2));
		latest4Product.add(latestProductList.get(3));

		int filter2 = 0;
		int topnum2 = 4;
		// 메인에서 전체상품 4개만 보여주기 위해 table 내용을 다 가지고와서  4개만 가지고오기
		ProductDAO productDAO2 = ProductDAO.getInstance();
		ArrayList<ProductDTO> ProductList = productDAO2.getAllProductList(topnum2, filter2);// topnum은 이제 의미없는 숫자이고 filter가 0인건 별다른 정렬없이 가져오겠다는 뜻
		ArrayList<ProductDTO> Product4 = new ArrayList<ProductDTO>();
		Product4.add(ProductList.get(0));
		Product4.add(ProductList.get(1));
		Product4.add(ProductList.get(2));
		Product4.add(ProductList.get(3));

		//request에 신상품, 전체상품 4개씩을 담아서 보냄
		request.setAttribute("latest4Product", latest4Product);
		request.setAttribute("allProduct", Product4);

		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
