package com.tohome.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tohome.dao.AddressDAO;
import com.tohome.dao.BasketDAO;
import com.tohome.dao.MemberDAO;
import com.tohome.dao.ProductDAO;
import com.tohome.dto.AddressDTO;
import com.tohome.dto.BasketDTO;
import com.tohome.dto.MemberDTO;
import com.tohome.dto.ProductDTO;

public class OrderPageAction implements Action{
//미림
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "member/order.jsp";
		
		HttpSession session = request.getSession();
	    MemberDTO loginUser = new MemberDTO();
	    loginUser.setUser_id((String)session.getAttribute("UserId"));
	    loginUser.setUser_no((Integer)(session.getAttribute("UserNo")));
	    
	    if (loginUser == null) {
	      url = "TohomeServlet?command=login_form";
	    }else{      
	    	
	    
	    
		
	    AddressDTO addressDTO = new AddressDTO();
	    AddressDAO addressDAO = AddressDAO.getInstance();
	    ArrayList<AddressDTO> addressList = addressDAO.getUserAddressList(loginUser.getUser_no());
	    addressDTO = addressList.get(0);
	    
	    
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
	    
	    
		ProductDAO productDAO=ProductDAO.getInstance();
		BasketDAO basketDAO=BasketDAO.getInstance();
		ArrayList<BasketDTO> basketList = new ArrayList<BasketDTO>();
		
		
//		System.out.println(basketDetailsNums.length);
		
		if(request.getParameter("prod_no") != null) {
	    	int prod_no = Integer.parseInt(request.getParameter("prod_no"));
			int quantity = Integer.parseInt(request.getParameter("quantity"));
			
			ProductDTO productDTO = productDAO.getProduct(prod_no);
			BasketDTO basketDTO = new BasketDTO();
			basketDTO.setBasket_detail_no(0);
			basketDTO.setPrice(productDTO.getPrice());
			basketDTO.setProd_name(productDTO.getProd_name());
			basketDTO.setProd_no(productDTO.getProd_no());
			basketDTO.setProd_quantity(quantity);
			basketDTO.setProd_img(productDTO.getProd_img());
			basketList.add(basketDTO);
	    }
	    else {// 장바구니로 구매할때
			//장바구니에서 오더액션으로 넘어왔을때는 최소 하나의 details_no이 들어오게 해야함 아니면 에러나!
			String[] basketDetailsNums = request.getParameter("details_nos").split(",");
			
			System.out.println(basketDetailsNums.length);
	    	ArrayList<BasketDTO> tempBasketList = new ArrayList<BasketDTO>();
	    	basketList = basketDAO.ImportUsersBasket(loginUser.getUser_no());
	    	for(int i = 0; i < basketList.size(); i++) {
	    		for (int j = 0; j < basketDetailsNums.length ; j ++) {
	    			if (basketList.get(i).getBasket_detail_no() == Integer.parseInt(basketDetailsNums[j])) {
	    				tempBasketList.add(basketList.get(i));
	    			}
	    		}
	    	}
	    	basketList = tempBasketList;
	    	
	    	request.setAttribute("basketDetailsNums", basketDetailsNums);
	    }
		
		
		
	    
	    
	    request.setAttribute("addressDTO", addressDTO);
	    request.setAttribute("currentUserDTO", loginUser);
	    request.setAttribute("userGrade", grade);
	    request.setAttribute("basketList", basketList);
	    
	    
	    
	    RequestDispatcher dispatcher = request
	        .getRequestDispatcher(url);
	    dispatcher.forward(request, response);
	}

	}
	}

