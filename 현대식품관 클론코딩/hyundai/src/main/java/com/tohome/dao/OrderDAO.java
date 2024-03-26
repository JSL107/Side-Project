package com.tohome.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.tohome.dto.OrderDTO;

import util.JDBConnect;


public class OrderDAO extends JDBConnect {
	private OrderDAO() {
	}

	private static OrderDAO instance = new OrderDAO();

	public static OrderDAO getInstance() {
		return instance;
	}

	public void insertOrderList(ArrayList<OrderDTO> orderList) {
		int result = 0;
		String query = "{call order_insert(?,?,?,?)}";  // 쿼리문 템플릿
		Connection con = null;
		CallableStatement cstmt = null;
		ResultSet rs = null;
		try {
			con = JDBConnect.getConnection();
		for(OrderDTO orderDTO:orderList) {
			 
	          // 쿼리 실행
	          cstmt = con.prepareCall(query); // 동적 쿼리문 준비
	          cstmt.setInt(1, orderDTO.getUser_no());
	          cstmt.setInt(2, orderDTO.getProd_quantity());
	          cstmt.setInt(3, orderDTO.getProd_no());
	          cstmt.setInt(4, orderDTO.getBasket_detail_no());
	          

	          // CallableStatement를 실행
	          //result = cstmt.executeQuery();
	          cstmt.executeUpdate();
	          
	      }
	      
		}catch (Exception e) {
	          e.printStackTrace();
	      }finally {
				JDBConnect.close();
			}
			
		}
		
	}

	


