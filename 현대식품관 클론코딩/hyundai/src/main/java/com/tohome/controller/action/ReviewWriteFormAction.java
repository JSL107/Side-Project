package com.tohome.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tohome.dto.MemberDTO;

//Written  by 미림
public class ReviewWriteFormAction implements Action {

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String url = "member/reviewWrite.jsp";
    
    HttpSession session = request.getSession();
    MemberDTO loginUser = (MemberDTO) session.getAttribute("UserId");    
    
    if (loginUser == null) {
      url = "TohomeServlet?command=login_form";
    } 
    
    request.getRequestDispatcher(url).forward(request, response);
  }
}
