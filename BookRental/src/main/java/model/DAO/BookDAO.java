/*CREATE TABLE BOOK(
id 			varchar2(20) PRIMARY KEY,
isbn 		number NOT NULL,
bname 		varchar2(30) NOT NULL,
author 		varchar2(30) NOT NULL,
publisher 	varchar2(30) NOT NULL,
bdate 		DATE,
bcnt 		number CONSTRAINT bcnt_check CHECK (bcnt>=0)
);
*/

package model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.domain.BookDTO;
import model.util.DBUtil;

public class BookDAO {

	// 책 등록
	public static boolean createBook(BookDTO Book) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("insert into book values(?, ?, ?, ?, ?, ?,?)");
			pstmt.setString(1, Book.getId());
			pstmt.setInt(2, Book.getIsbn());
			pstmt.setString(3, Book.getBname());
			pstmt.setString(4, Book.getAuthor());
			pstmt.setString(5, Book.getPublisher());
			pstmt.setString(6, Book.getBdate());
			pstmt.setInt(7, Book.getBcnt());

			int result = pstmt.executeUpdate();

			if (result == 1) {
				return true;
			}
		} finally {
			DBUtil.close(con, pstmt);
		}
		return false;
	}

	// 책 삭제
	public static boolean deleteBook(String bookId) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("delete from book where id=?");
			pstmt.setString(1, bookId);
			

			int result = pstmt.executeUpdate();
			
			// 만약에 -1 이 들어오면 무시
			// 정수값이 들어오면 그것만큼 감소
			if (result == 1) {
				return true;
			}

		} finally {
			DBUtil.close(con, pstmt);
		}
		return false;
	}
	
	//책 권수 추가
	public static boolean updateBook(String id, int cnt) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = DBUtil.getConnection();
			BookDTO book = new BookDTO();
			
			if(cnt>0) {
				pstmt = con.prepareStatement("update book set bcnt=bcnt+? where id=?");
				pstmt.setInt(1,	cnt);
				pstmt.setString(2, id);
			}else {
				// 아니면 끝
				DBUtil.close(con, pstmt);
			}
			int result = pstmt.executeUpdate();
			if (result == 1) {
				return true;
			}

		} finally {
			DBUtil.close(con, pstmt);
		}
		return false;
	}
	
	//책 권수 삭제
	public static boolean minusBook(String id, int cnt) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = DBUtil.getConnection();
			BookDTO book = new BookDTO();
			if(cnt>0) {
				
				pstmt = con.prepareStatement("update book set bcnt=bcnt-? where id =?");
				pstmt.setInt(1,	cnt);
				pstmt.setString(2, id);
			}else {
				// 아니면 끝
				DBUtil.close(con, pstmt);
			}
			

			int result = pstmt.executeUpdate();
			
			// 만약에 -1 이 들어오면 무시
			// 정수값이 들어오면 그것만큼 감소
			if (result == 1) {
				return true;
			}

		} finally {
			DBUtil.close(con, pstmt);
		}
		return false;
	}
	
	// 출력
	public static BookDTO getBook(String bookId) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		BookDTO book = null;

		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("select * from book where id=?");
			pstmt.setString(1, bookId);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				book = new BookDTO(rset.getString(1), rset.getInt(2), rset.getString(3), rset.getString(4),
						rset.getString(5), rset.getString(6),rset.getInt(7));
			}
		} finally {
			DBUtil.close(con, pstmt, rset);
		}
		return book;
	}
	
	public static ArrayList<BookDTO> getAllBooks() throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<BookDTO> book = null;

		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("select * from book");
			rset = pstmt.executeQuery();
			book = new ArrayList<BookDTO>();
			while(rset.next()) {
				book.add(new BookDTO(rset.getString(1), rset.getInt(2), rset.getString(3), rset.getString(4),
						rset.getString(5), rset.getString(6),rset.getInt(7)));
			}
		} finally {
			DBUtil.close(con, pstmt, rset);
		}
		return book;
	}
	
	
	public static void main(String args[]) {

		try {

			// 추가
//			addBook(new BookDTO("A0005", 0005, "자존감수업", "윤동균", "심플라이프", "2022-02-11", 4));
//			System.out.println("책 추가 됨");
			
//			plusBook("A0005",5); //5권추가
//			System.out.println("추가되었습니다.");
			
//			minusBook("A0005", 4);
			
			
			// 삭제
//			deleteBook("A0005");
//			System.out.println("책 삭제 됨");
//			
//			// 검색
//			getSelect("A0005");
//			System.out.println("행 검색");
//			
//			getAllSelect();

			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
