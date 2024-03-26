package com.tohome.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tohome.dao.ProductDAO;
import com.tohome.dao.ReviewDAO;
import com.tohome.dto.ProductDTO;
import com.tohome.dto.ReviewDTO;

//Written  by 미림
public class ProductDetailAction implements Action {

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String url="product/product_details.jsp";
    
    //request로 받은 prod_no을 공백제거후 prod_no변수에 담음
    int prod_no= Integer.parseInt(request.getParameter("prod_no").trim());
    
    
    ProductDAO productDAO=ProductDAO.getInstance();
    ProductDTO productDTO= productDAO.getProduct(prod_no); //getProduct에 prod_no을 인자로 주어 해당 제품의 상세column 값들을 DTO에 반환받아 저장
    
    ReviewDAO reviewDAO=ReviewDAO.getInstance();
    //해당 물품의 리뷰들을 getProductReviewList로 받아와 productReviewList에 저장
	ArrayList<ReviewDTO> productReviewList= reviewDAO.getProductReviewList(prod_no);
	
    
	//위에서 얻은 productDTO,productReviewList를 request에 담음
    request.setAttribute("productDTO", productDTO);
    request.setAttribute("reviewList", productReviewList);
    //request.setAttribute("memberDTO", memberDTO);
    
    RequestDispatcher dispatcher = request
        .getRequestDispatcher(url);
    dispatcher.forward(request, response);
  }
}
