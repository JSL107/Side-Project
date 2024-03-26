package com.tohome.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tohome.dao.ReviewDAO;
import com.tohome.dto.MemberDTO;
import com.tohome.dto.ReviewDTO;
//Written  by 미림
public class ReviewWriteAction implements Action {

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String url = "TohomeServlet?command=product_detail";
    
    HttpSession session = request.getSession();
    MemberDTO loginUser = new MemberDTO();
    loginUser.setUser_id((String)session.getAttribute("UserId"));
    loginUser.setUser_no((Integer)(session.getAttribute("UserNo")));
    
    if (loginUser == null) {
      url = "TohomeServlet?command=login_form";
    }else{      
      ReviewDTO reviewDTO = new ReviewDTO();
      
      
      
      
      reviewDTO.setProduct_detail_prod_no(Integer.parseInt(request.getParameter("prod_no")));
      reviewDTO.setReview_star(Integer.parseInt(request.getParameter("review_star")));
      reviewDTO.setUser_user_no(loginUser.getUser_no());
      reviewDTO.setReview_write(request.getParameter("review_write"));
      
      ReviewDAO reviewDAO = ReviewDAO.getInstance();
      reviewDAO.insertReview(reviewDTO);
      
      url += "&prod_no="+reviewDTO.getProduct_detail_prod_no()+"&tab_info=review";
      
    }    
    response.sendRedirect(url);
  }
}
