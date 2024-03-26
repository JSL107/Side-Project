package util;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletContext;

public class JDBConnect {
    public static Connection con;
    public static Statement stmt;
    public static PreparedStatement psmt;
    public static ResultSet rs;
    public static CallableStatement cstmt;
    private static String url = "jdbc:oracle:thin:@localhost:1521/xepdb1";
    private static String id = "tohome";
    private static String pwd = "1234";

    // 기본 생성자
    public JDBConnect() {
        try {
            // JDBC 드라이버 로드
            Class.forName("oracle.jdbc.OracleDriver");

            // DB에 연결
            url = "jdbc:oracle:thin:@localhost:1521/xepdb1";
            id = "tohome";
            pwd = "1234";
            con = DriverManager.getConnection(url, id, pwd);

            System.out.println("DB 연결 성공(기본 생성자)");
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 두 번째 생성자
    public JDBConnect(String driver, String url, String id, String pwd) {
        try {
            // JDBC 드라이버 로드
            Class.forName(driver);

            // DB에 연결
            con = DriverManager.getConnection(url, id, pwd);

            System.out.println("DB 연결 성공(인수 생성자 1)");
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }

 // 카넥션 얻어오기
 	public static Connection getConnection() {
 		Connection conn = null;
 		try {
 			Class.forName("oracle.jdbc.driver.OracleDriver");
 			conn = DriverManager.getConnection(url, id, pwd);
 		} catch (Exception e) {
 			e.printStackTrace();
 		}
 		return conn;
 	}
    

    // 연결 해제(자원 반납)
    public static void close() {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (psmt != null) psmt.close();
            if (cstmt != null) cstmt.close();
	        //로그인 -> 로그아웃 -> 로그인하면 이게 싱글톤이라 con이 영영 닫혀버려서 con은 안닫게 해놨음
	        //추후 커넥션풀 사용할때 전체적으로 조정하자
            if (con != null) con.close();

            System.out.println("JDBC 자원 해제");
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}