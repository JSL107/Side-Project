package com.tohome.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.JDBConnect;

import com.tohome.dto.MemberDTO;
import com.tohome.dto.ProductDTO;
import com.tohome.dto.ReviewDTO;

import oracle.jdbc.OracleCallableStatement;
import oracle.jdbc.OracleTypes;

public class ReviewDAO {

  private ReviewDAO() {
  }

  private static ReviewDAO instance = new ReviewDAO();

  public static ReviewDAO getInstance() {
    return instance;
  }

	//Written  by 미림
  public ArrayList<ReviewDTO> listReview(String id) {
    ArrayList<ReviewDTO> reviewList = new ArrayList<ReviewDTO>();
    String sql = "select * from review where id=? order by qseq desc";

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    try {
      conn = JDBConnect.getConnection();
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, id);
      rs = pstmt.executeQuery();
      while (rs.next()) {
        ReviewDTO reviewDTO = new ReviewDTO();
//        reviewDTO.setQseq(rs.getInt("qseq"));
//        reviewDTO.setSubject(rs.getString("subject"));
//        reviewDTO.setContent(rs.getString("content"));
//        reviewDTO.setId(rs.getString("id"));
//        reviewDTO.setIndate(rs.getTimestamp("indate"));
//        reviewDTO.setReply(rs.getString("reply"));
//        reviewDTO.setRep(rs.getString("rep"));
        reviewList.add(reviewDTO);
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
    return reviewList;
  }

  public ReviewDTO getReview(int seq) {
    ReviewDTO reviewDTO = null;
    String sql = "select * from review where qseq=?";
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    try {
      conn = JDBConnect.getConnection();
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, seq);
      rs = pstmt.executeQuery();
      if (rs.next()) {
        reviewDTO = new ReviewDTO();
//        ReviewDTO.setQseq(seq);
//        ReviewDTO.setSubject(rs.getString("subject"));
//        ReviewDTO.setContent(rs.getString("content"));
//        ReviewDTO.setId(rs.getString("id"));
//        ReviewDTO.setIndate(rs.getTimestamp("indate"));
//        ReviewDTO.setReply(rs.getString("reply"));
//        ReviewDTO.setRep(rs.getString("rep"));
      }
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      JDBConnect.close();
    }
    return reviewDTO;
  }

  public void insertReview(ReviewDTO reviewDTO) {
	  
      String query = "{call review_write(?,?,?,?)}";  // 쿼리문 템플릿
     
	  Connection con = null;
	  CallableStatement cstmt = null;
	  ResultSet rs = null;
      try{
    	  con = JDBConnect.getConnection();
		  
          // 쿼리 실행
          cstmt = con.prepareCall(query); // 동적 쿼리문 준비
          cstmt.setInt(1, reviewDTO.getReview_star());
          cstmt.setString(2, reviewDTO.getReview_write());
          cstmt.setInt(3, reviewDTO.getUser_user_no());
          cstmt.setInt(4, reviewDTO.getProduct_detail_prod_no());
         


          // CallableStatement를 실행
          int cnt =cstmt.executeUpdate();

        //성공하면 세션을 위한 id, name넣기 ~
          if (cnt > 0){
           System.out.println("리뷰작성완료");
          }
      }catch (Exception e) {
          e.printStackTrace();
      }finally {
			JDBConnect.close();
		}
   
  }


  public void updateReview(ReviewDTO reviewDTO) {
    String sql = "update review set reply=?, rep='2' where qseq=?";

    Connection conn = null;
    PreparedStatement pstmt = null;
    try {
      conn = JDBConnect.getConnection();
      pstmt = conn.prepareStatement(sql);
//      pstmt.setString(1, reviewDTO.getReply());
//      pstmt.setInt(2, reviewDTO.getQseq());      
      pstmt.executeUpdate();
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      JDBConnect.close();
    }
  }

public ArrayList<ReviewDTO> getProductReviewList(int prod_no) {
	ArrayList<ReviewDTO> productReviewList = new ArrayList<ReviewDTO>();
	
	String sql = "{call selectAllReview(?,?)}";

	Connection conn = null;
	CallableStatement cstmt=null;
	ResultSet rs = null;

	try {
		conn = JDBConnect.getConnection();
		cstmt = conn.prepareCall(sql);
        cstmt.registerOutParameter(1, OracleTypes.CURSOR);
        cstmt.setInt(2, prod_no);
		
        // CallableStatement를 실행
        cstmt.executeQuery();

        // getCursor() 메서드를 사용하기 위해 OracleCallableStatement Object로 변환
        // CallableStatement는 getCursor() 메서드가 정의되어 있지 않기 때문
        OracleCallableStatement ocstmt = (OracleCallableStatement)cstmt;
        // ResultSet에 결과 데이터를 담은 Cursor를 저장
        rs = ocstmt.getCursor(1);
          
		while (rs.next()) {
			ReviewDTO review = new ReviewDTO();
			review.setReview_no(rs.getInt("review_no"));
			review.setProduct_detail_prod_no(rs.getInt("PRODUCT_DETAIL_PROD_NO"));
			review.setReview_star(rs.getInt("review_star"));
			review.setReview_upload_date(rs.getString("REVIEW_UPLOAD_DATE"));
			review.setUser_id(rs.getString("user_id"));
			review.setReview_write(rs.getString("review_write"));
			productReviewList.add(review);
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		JDBConnect.close();
	}
    return productReviewList;
}

public void deleteReview(ReviewDTO reviewDTO) {
	String query = "{call review_delete(?)}";  // 쿼리문 템플릿
    
	  Connection con = null;
	  CallableStatement cstmt = null;
	  ResultSet rs = null;
    try{
  	  con = JDBConnect.getConnection();
		  
        // 쿼리 실행
        cstmt = con.prepareCall(query); // 동적 쿼리문 준비
        cstmt.setInt(1, reviewDTO.getReview_no());

        // CallableStatement를 실행
        int cnt =cstmt.executeUpdate();

      //성공하면 세션을 위한 id, name넣기 ~
        if (cnt > 0){
         System.out.println("리뷰삭제완료");
        }
    }catch (Exception e) {
        e.printStackTrace();
    }finally {
			JDBConnect.close();
		}
	
}

//미림
public ArrayList<ReviewDTO> getUserReviewList(String user_id) {
ArrayList<ReviewDTO> userReviewList = new ArrayList<ReviewDTO>();
	
	String sql = "select * from F_SELECTUSERREVIEW(?)";

	Connection conn = null;
	CallableStatement cstmt=null;
	ResultSet rs = null;

	try {
		conn = JDBConnect.getConnection();
		cstmt = conn.prepareCall(sql);
        cstmt.setString(1, user_id);
		
        // CallableStatement를 실행
        rs=cstmt.executeQuery();
          
		while (rs.next()) {
			ReviewDTO review = new ReviewDTO();
			review.setReview_no(rs.getInt("review_no"));
			review.setProduct_detail_prod_no(rs.getInt("PRODUCT_DETAIL_PROD_NO"));
			review.setReview_star(rs.getInt("review_star"));
			review.setReview_upload_date(rs.getString("REVIEW_UPLOAD_DATE"));
			review.setUser_id(rs.getString("user_id"));
			review.setReview_write(rs.getString("review_write"));
			userReviewList.add(review);
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		JDBConnect.close();
	}
    return userReviewList;
}
}
