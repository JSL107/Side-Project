package com.tohome.controller.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tohome.dao.BasketDAO;
import com.tohome.dao.MemberDAO;
import com.tohome.dto.BasketDTO;
import com.tohome.dto.MemberDTO;

public class MyPageAction implements Action{
//미림
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "member/my_page.jsp";
		
		HttpSession session = request.getSession();
	    MemberDTO loginUser = new MemberDTO();
	    loginUser.setUser_id((String)session.getAttribute("UserId"));
	    loginUser.setUser_no((Integer)(session.getAttribute("UserNo")));
	    
	    if (loginUser == null) {
	      url = "TohomeServlet?command=login_form";
	    }else{      
	    	
	    	MemberDAO memberDAO = MemberDAO.getInstance();
			loginUser = memberDAO.getLoginUser(loginUser.getUser_no());
			
			
		    String grade = "";
		    if(loginUser.getGrade().equals("0")) {
		    	grade = "BRONZE";
		    }
		    else if(loginUser.getGrade().equals("1")) {
		    	grade = "SILVER";
		    }
		    else if(loginUser.getGrade().equals("2")) {
		    	grade = "GOLD";
		    }
		    else if(loginUser.getGrade().equals("3")) {
		    	grade = "DIA";
		    }
		    
	    
	    
	
	    request.setAttribute("currentUserDTO", loginUser);
	    
	    
	    
	    RequestDispatcher dispatcher = request
	        .getRequestDispatcher(url);
	    dispatcher.forward(request, response);
	}

	}
	}

