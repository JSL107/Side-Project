package com.tohome.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tohome.dao.ProductDAO;

public class ChartPageAction implements Action{

	//Written by 승준
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "chart.jsp";
		
		
		ProductDAO pdao = ProductDAO.getInstance();// productDAO 인스턴스 받음
		// getProductCountforCategory를 실행시켜서 카테고리별 count를 받아옴
		ArrayList<Integer> datas = pdao.getProductCountforCategory();
		

		request.setAttribute("datas", datas);// 받아온 데이타를 request에 담음 
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
//		response.sendRedirect(url);
	}

}
