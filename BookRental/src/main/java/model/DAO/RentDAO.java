package model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import model.domain.RentDTO;
import model.util.DBUtil;

public class RentDAO {

	// 책 대출하기
	public static boolean createRent(String id, String bid) throws Exception {
		Connection con = null;
		Statement stmt = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ResultSet rset2 = null;

		try {
			con = DBUtil.getConnection();
			
			stmt = con.createStatement();
			rset = stmt.executeQuery("select maxloan from members where id = "+id);
			rset2 = stmt.executeQuery("select bcnt from book where id = "+bid);
			int maxloan = rset.getInt("maxloan");
			
			if(maxloan > 0 && rset2.getInt("bcnt") > 0) {
				pstmt = con.prepareStatement("insert into rent values(?, ?, ?, ?)"); 
				pstmt.setString(1,id+bid+maxloan);
				pstmt.setString(2,bid);
				pstmt.setString(3,id);
				pstmt.setString(4,new SimpleDateFormat("yy-mm-dd").format(new Date()));

				int result = pstmt.executeUpdate();

				if (result == 1) {
					return true;
				}
			}else {
				
			}
			
			//INSERT INTO RENT VALUES(1,'A0001','JS0107','2022-02-02');
			
		} finally {
			DBUtil.close(con, pstmt);
		}
		return false;
	}
	
	//책 대출 현황보기
	public static RentDTO rentNow(String rentId) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		RentDTO rent = null;

		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("select * from rent where id=?");
			pstmt.setString(1, rentId);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				rent= (new RentDTO(rset.getInt(1), rset.getString(2), rset.getString(3), rset.getString(4)));
			}
		} finally {
			DBUtil.close(con, pstmt, rset);
		}
		return rent;
	}
	
	// select
	// 전체 출력
		public static ArrayList<RentDTO> getAllRents() throws SQLException {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			ArrayList<RentDTO> rent = null;

			try {
				con = DBUtil.getConnection();
				pstmt = con.prepareStatement("select * from book");
				rset = pstmt.executeQuery();
				rent = new ArrayList<RentDTO>();
				while(rset.next()) {
					rent.add(new RentDTO(rset.getInt(1), rset.getString(2), rset.getString(3), rset.getString(4)));
				}
			} finally {
				DBUtil.close(con, pstmt, rset);
			}
			return rent;
		}
		
		public static boolean deleteRent(String id) throws SQLException{
			return false;
		}
}
