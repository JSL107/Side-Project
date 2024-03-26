package com.tohome.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tohome.dao.BasketDAO;
import com.tohome.dao.MemberDAO;
import com.tohome.dao.OrderDAO;
import com.tohome.dto.MemberDTO;
import com.tohome.dto.OrderDTO;

public class OrderAction implements Action {
//미림, 여명
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "member/orderComplete.jsp";

		HttpSession session = request.getSession();
		MemberDTO loginUser = new MemberDTO();
		loginUser.setUser_id((String) session.getAttribute("UserId"));
		loginUser.setUser_no((Integer) (session.getAttribute("UserNo")));

		// 로그인 안했으면 로그인 페이지
		if (loginUser == null) {
			url = "TohomeServlet?command=login_form";
		} else {

			MemberDAO memberDAO = MemberDAO.getInstance();
			loginUser = memberDAO.getLoginUser(loginUser.getUser_no());

			OrderDAO orderDAO = OrderDAO.getInstance();
			ArrayList<OrderDTO> orderList = new ArrayList<OrderDTO>();
			String[] prodNoList = request.getParameterValues("prod_no");
			String[] prodQuanList = request.getParameterValues("prod_quantity");
			//일단 바로주문하기는 길이가 1이므로 0을 넣어놓고
			String[] basketDetailsNums = null ;
			//장바구니에서 주문하기로 왔으면 담긴 물품들 담아서 insert_order에 같이 담아서 주기!
			if (request.getParameterValues("basketDetailsNums") != null) {
				basketDetailsNums = request.getParameterValues("basketDetailsNums");
			}
			System.out.println(basketDetailsNums);
			OrderDTO orderDTO = new OrderDTO();
			for (int i = 0; i < prodNoList.length; i++) {
				orderDTO = new OrderDTO();
				orderDTO.setProd_no(Integer.parseInt(prodNoList[i]));
				orderDTO.setProd_quantity(Integer.parseInt(prodQuanList[i]));
				orderDTO.setUser_no(loginUser.getUser_no());
				//일단 orderDTO의 basket_detail_no 기본값이 0 이니까 바로구매에서는 이거 안넣어줘도 되지
				if (basketDetailsNums != null) {
					orderDTO.setBasket_detail_no(Integer.parseInt(basketDetailsNums[i]));
				}
				
				orderList.add(orderDTO);
			}

			orderDAO.insertOrderList(orderList);
			
			BasketDAO bdao =  BasketDAO.getInstance();
	        int basketCount = bdao.CountBasketItem(loginUser.getUser_no());
	        
	        session.setAttribute("basketCount", basketCount);
			request.setAttribute("currentUserDTO", loginUser);

			RequestDispatcher dispatcher = request.getRequestDispatcher(url);
			dispatcher.forward(request, response);
		}

	}
}
