package com.tohome.dao;

import util.JDBConnect;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.tohome.dto.MemberDTO;
import oracle.jdbc.OracleCallableStatement;
import oracle.jdbc.OracleType;
import oracle.jdbc.OracleTypes;

//Written  by 여명, 승준
public class MemberDAO extends JDBConnect{
	private MemberDAO() {
	}

	private static MemberDAO instance = new MemberDAO();

	public static MemberDAO getInstance() {
		return instance;
	}
	

  // 회원가입 가능한 id인지 체크
  //Written by 여명, 승준
  public int checkID(String uid){
      String query = "{call member_pkg.id_check(?,?)}"; // sql문 준비(미리 정의해놓은 패키지안의 프로시저에 선언한 인자만큼 ? 를 넣음)
      int result = 0;

	  Connection con = null;
	  CallableStatement cstmt = null;
	  ResultSet rs = null;
	  
      try{
    	  con = JDBConnect.getConnection();
		  
          cstmt = con.prepareCall(query); // 동적 쿼리문 준비
          cstmt.setString(1, uid);//? 에 각각 맞는 값을 넣음
          cstmt.registerOutParameter(2, OracleType.NUMBER);//? 에 각각 맞는 값을 넣음 이는 프로시저에서 out모드로 나온 숫자값을 받기위해 outParameter로 등록!

          cstmt.executeQuery();
          result = cstmt.getInt(2);

      }catch(Exception e){
          e.printStackTrace();
      }finally {
			JDBConnect.close();
		}

      return result;// 등록된 Id가 있으면 1 없으면 0
  }

  //Written by 여명, 승준
  public MemberDTO memberJoin(
          String userId,
          String userPwd,
          String userName,
          String bithYMD,
          String mobileNum,
          String gender,
          String addressMain,
          String addressDetail,
          String addressName )
      {
      MemberDTO dto = new MemberDTO();  // 회원 정보 DTO 객체 생성
      String query = "{call mpkg.member_join(?,?,?,?,?,?,?,?,?,?)}";  // sql문 준비(미리 정의해놓은 패키지안의 프로시저에 선언한 인자만큼 ? 를 넣음)
     
	  Connection con = null;
	  CallableStatement cstmt = null;
	  ResultSet rs = null;
      try{
    	  con = JDBConnect.getConnection();
		  
          // 쿼리 실행
          cstmt = con.prepareCall(query); // 동적 쿼리문 준비
          cstmt.setString(1, userId);//? 에 각각 맞는 값을 넣음
          cstmt.setString(2, userPwd);//? 에 각각 맞는 값을 넣음
          cstmt.setString(3, userName);//? 에 각각 맞는 값을 넣음
          cstmt.setString(4, bithYMD);//? 에 각각 맞는 값을 넣음
          cstmt.setString(5, mobileNum);//? 에 각각 맞는 값을 넣음
          cstmt.setString(6, gender);//? 에 각각 맞는 값을 넣음
          cstmt.setString(7, addressMain);//? 에 각각 맞는 값을 넣음
          cstmt.setString(8, addressDetail);//? 에 각각 맞는 값을 넣음
          cstmt.setString(9, addressName);//? 에 각각 맞는 값을 넣음
          cstmt.registerOutParameter(10, OracleType.NUMBER);//? 에 각각 맞는 값을 넣음 이는 프로시저에서 out모드로 나온 숫자값을 받기위해 outParameter로 등록!


          // CallableStatement를 실행, 테이블에 잘 들어가면 들어간 row만큼 숫자를 뱉음
          int cnt =cstmt.executeUpdate();

          //1이성이면 성공, 성공하면 세션을 위한 id, name, user_no넣기 ~
          if (cnt > 0){
              dto.setUser_id(userId);
              dto.setUser_name(userName);
              dto.setUser_no(cstmt.getInt(10));
          }
      }catch (Exception e) {
          e.printStackTrace();
      }finally {
			JDBConnect.close();
		}
      return dto;
  }
  // 명시한 아이디/패스워드와 일치하는 회원 정보를 반환합니다.
  // Written by 여명, 승준
  public MemberDTO getLoginMemberDTO(String uid, String pwd) {
      MemberDTO dto = new MemberDTO();  // 회원 정보 DTO 객체 생성
      String query = "{call mpkg.member_login(?,?,?)}";  // 쿼리문 템플릿
	  
      Connection con = null;
	  CallableStatement cstmt = null;
	  ResultSet rs = null;
      try {
    	  con = JDBConnect.getConnection();
          // 쿼리 실행
          cstmt = con.prepareCall(query); // 동적 쿼리문 준비
          cstmt.setString(1, uid);
          cstmt.setString(2, pwd);
          cstmt.registerOutParameter(3, OracleTypes.CURSOR);
          //OracleTypes.CURSOR를 사용할려면 ojdbc8.jar 안에있는 거라 라이브러리 추가 같은 세팅 해야함

          // CallableStatement를 실행
          cstmt.executeQuery();

          // getCursor() 메서드를 사용하기 위해 OracleCallableStatement Object로 변환
          // CallableStatement는 getCursor() 메서드가 정의되어 있지 않기 때문
          OracleCallableStatement ocstmt = (OracleCallableStatement)cstmt;
          // ResultSet에 결과 데이터를 담은 Cursor를 저장
          rs = ocstmt.getCursor(3);

          // 결과 처리
          if (rs.next()) {
              // 쿼리 결과로 얻은 회원 정보를 DTO 객체에 저장
              dto.setUser_no(rs.getInt("user_no"));
              dto.setUser_id(rs.getString("user_id"));
              dto.setPwd(rs.getString("pwd"));
              dto.setUser_name(rs.getString("user_name"));
              dto.setBirth_ymd(rs.getString("birth_ymd"));
              dto.setMobile_num(rs.getString("mobile_num"));
              dto.setGender(rs.getInt("gender"));
              dto.setGrade(rs.getString("grade"));
              dto.setSale_rate(rs.getInt("sale_rate"));
              dto.setBuy_sum(rs.getInt("buy_sum"));
          }
      }
      catch (Exception e) {
          e.printStackTrace();
      }finally {
			JDBConnect.close();
		}

      return dto;  // DTO 객체 반환
  }

// 세션에 로그인되어 있는 userno로 user의 모든 정보를 가져온다.(세션에는 일부정보만 존재, 다른 메서드의 경우
 // Written by 미림
public MemberDTO getLoginUser(int user_no) {
	MemberDTO dto = new MemberDTO();  // 회원 정보 DTO 객체 생성
    String query = "{call get_login_user(?,?)}";  // 쿼리문 템플릿
	  
    Connection con = null;
	  CallableStatement cstmt = null;
	  ResultSet rs = null;
    try {
  	  con = JDBConnect.getConnection();
        // 쿼리 실행
        cstmt = con.prepareCall(query); // 동적 쿼리문 준비
        cstmt.setInt(1, user_no);
        cstmt.registerOutParameter(2, OracleTypes.CURSOR);
        //OracleTypes.CURSOR를 사용할려면 ojdbc8.jar 안에있는 거라 라이브러리 추가 같은 세팅 해야함

        // CallableStatement를 실행
        cstmt.executeQuery();

        // getCursor() 메서드를 사용하기 위해 OracleCallableStatement Object로 변환
        // CallableStatement는 getCursor() 메서드가 정의되어 있지 않기 때문
        OracleCallableStatement ocstmt = (OracleCallableStatement)cstmt;
        // ResultSet에 결과 데이터를 담은 Cursor를 저장
        rs = ocstmt.getCursor(2);

        // 결과 처리
        if (rs.next()) {
            // 쿼리 결과로 얻은 회원 정보를 DTO 객체에 저장
            dto.setUser_no(rs.getInt("user_no"));
            dto.setUser_id(rs.getString("user_id"));
            dto.setUser_name(rs.getString("user_name"));
            dto.setBirth_ymd(rs.getString("birth_ymd"));
            dto.setMobile_num(rs.getString("mobile_num"));
            dto.setGender(rs.getInt("gender"));
            dto.setGrade(rs.getString("grade"));
            dto.setSale_rate(rs.getInt("sale_rate"));
            dto.setBuy_sum(rs.getInt("buy_sum"));
        }
    }
    catch (Exception e) {
        e.printStackTrace();
    }finally {
			JDBConnect.close();
		}

    return dto;  // DTO 객체 반환
}


}
