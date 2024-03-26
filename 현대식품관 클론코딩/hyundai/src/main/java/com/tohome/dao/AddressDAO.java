package com.tohome.dao;

import util.JDBConnect;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.tohome.dto.AddressDTO;
import com.tohome.dto.MemberDTO;
import com.tohome.dto.ProductDTO;

import oracle.jdbc.OracleCallableStatement;
import oracle.jdbc.OracleType;
import oracle.jdbc.OracleTypes;

//Written  by 미림 배송지 테이블에서 가져오기에 그냥 addressdao에 만듬 
public class AddressDAO extends JDBConnect{


	private AddressDAO() {
	}

	private static AddressDAO instance = new AddressDAO();

	public static AddressDAO getInstance() {
		return instance;
	}

	public ArrayList<AddressDTO> getUserAddressList(int user_no) {
		ArrayList<AddressDTO> userAddressList = new ArrayList<AddressDTO>();
	      String sql = "{call getUserInfo(?,?)}";

	      Connection conn = null;
	      CallableStatement cstmt=null;
	      ResultSet rs = null;

	      try {
	         conn = JDBConnect.getConnection();
	         cstmt = conn.prepareCall(sql);
	         cstmt.registerOutParameter(1, OracleTypes.CURSOR);
	         cstmt.setInt(2, user_no);
	           
	         
	           // CallableStatement를 실행
	           cstmt.executeQuery();

	           // getCursor() 메서드를 사용하기 위해 OracleCallableStatement Object로 변환
	           // CallableStatement는 getCursor() 메서드가 정의되어 있지 않기 때문
	           OracleCallableStatement ocstmt = (OracleCallableStatement)cstmt;
	           // ResultSet에 결과 데이터를 담은 Cursor를 저장
	           rs = ocstmt.getCursor(1);
	             
	         while (rs.next()) {
	        	AddressDTO address = new AddressDTO();
	        	address.setUser_name(rs.getString("user_name"));
	        	address.setMain_address(rs.getString("main_address"));
	        	address.setMobile_num(rs.getString("mobile_num"));
	        	
	        	userAddressList.add(address);
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         JDBConnect.close();
	      }
	      return userAddressList;
	}
	

 


}
