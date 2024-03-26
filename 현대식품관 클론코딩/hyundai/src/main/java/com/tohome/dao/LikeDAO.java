package com.tohome.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.tohome.dto.BasketDTO;
import com.tohome.dto.LikeDTO;

import oracle.jdbc.OracleCallableStatement;
import oracle.jdbc.OracleTypes;
import util.JDBConnect;

public class LikeDAO extends JDBConnect {
	private LikeDAO() {
	}

	private static LikeDAO instance = new LikeDAO();

	public static LikeDAO getInstance() {
		return instance;
	}
	
	// Written by 여명, 승준
	public int InsertLike(int userNo, int prodNo) {
		int result = 0;
		String query = "{call like_pkg.input_like(?,?)}"; // 쿼리문 템플릿

		Connection con = null;
		CallableStatement cstmt = null;

		ResultSet rs = null;
		try {
			con = JDBConnect.getConnection();
			// 쿼리 실행
			cstmt = con.prepareCall(query); // 동적 쿼리문 준비
			cstmt.setInt(1, userNo);
			cstmt.setInt(2, prodNo);

			result = cstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBConnect.close();
		}
		return result;
	}
	public ArrayList<LikeDTO> ImportUsersLike(int userNo) {
		ArrayList<LikeDTO> userLikeList = new ArrayList<LikeDTO>();
		String query = "{call like_pkg.import_users_like(?,?)}"; // 쿼리문 템플릿

		Connection con = null;
		CallableStatement cstmt = null;
		ResultSet rs = null;
		try {
			con = JDBConnect.getConnection();
			// 쿼리 실행
			cstmt = con.prepareCall(query); // 동적 쿼리문 준비
			cstmt.setInt(1, userNo);
			cstmt.registerOutParameter(2, OracleTypes.CURSOR);
			// OracleTypes.CURSOR를 사용할려면 ojdbc8.jar 안에있는 거라 라이브러리 추가 같은 세팅 해야함

			// CallableStatement를 실행
			cstmt.executeQuery();

			// getCursor() 메서드를 사용하기 위해 OracleCallableStatement Object로 변환
			// CallableStatement는 getCursor() 메서드가 정의되어 있지 않기 때문
			OracleCallableStatement ocstmt = (OracleCallableStatement) cstmt;
			// ResultSet에 결과 데이터를 담은 Cursor를 저장
			rs = ocstmt.getCursor(2);

			while (rs.next()) {
				LikeDTO likedto = new LikeDTO();

				likedto.setProd_no(rs.getInt("pno"));
				likedto.setProd_img(rs.getString("pimg"));
				likedto.setProd_name(rs.getString("pname"));
				likedto.setPrice(rs.getInt("price"));

				userLikeList.add(likedto);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBConnect.close();
		}

		return userLikeList;
	}

}
