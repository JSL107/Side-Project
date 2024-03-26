package com.tohome.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tohome.dao.BasketDAO;
import com.tohome.dao.LikeDAO;
import com.tohome.dto.BasketDTO;
import com.tohome.dto.LikeDTO;

public class LikePageAction implements Action{

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "member/like_page.jsp";
		
		HttpSession session =request.getSession();
		
		//로그인 했을때 세션에 UserNo 을 담아놔서 없으면 로그인 안한거, 있으면 한거
		if (session.getAttribute("UserNo")==null) {
			// 로그인 안했으면 로그인 페이로 이동
			url="member/login_form.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(url);
			dispatcher.forward(request, response);
		}
		
		//여기부터는 로그인했을 때 작동되는 부분이라 세션에 담긴 UserNO을 가지고와서
		int userNo = (int)session.getAttribute("UserNo");
		LikeDAO likeDAO = LikeDAO.getInstance();
		
		// likeDAO에 회원이 좋아요누른 목록들을 LikeDTO 담아서 배열화 시킴
		ArrayList<LikeDTO> likeList = likeDAO.ImportUsersLike(userNo);
		
		// 반환받은 배열을 requset에 담음
		request.setAttribute("likeList", likeList);

		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

}
