package com.tohome.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tohome.dao.LikeDAO;

public class LikeAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session =request.getSession();
		
		// (로그인 했는지 안했는지는 prodeuct_detail.jsp에서 확인함)로그인 했을때 세션에서 UserNo과 해당 prod_no을 가지고와서 
		int userNo = (int)session.getAttribute("UserNo");
		int prodNo =  Integer.parseInt(request.getParameter("prod_no"));
		
		//LikeDAO를 통해 like table에 저장
		LikeDAO likeDAO = LikeDAO.getInstance();
		likeDAO.InsertLike(userNo, prodNo);
	}

}
