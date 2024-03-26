package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.EbookModel;
import model.domain.BookDTO;
import model.domain.MemberDTO;
import model.domain.RentDTO;

@WebServlet("/controller")
public class Controller extends HttpServlet {
	public Controller() {
		super();
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String command = request.getParameter("command");
		
		try {
			if(command.equals("login")) {
				Login(request, response);
			}else if(command.equals("memberInsert")){
				memberInsert(request, response);
			}else if(command.equals("memberUpdate")){
				memberUpdate(request, response);
			}else if(command.equals("memberDelete")){
				memberDelete(request, response);
			}else if(command.equals("memberInfo")){
				memberInfo(request, response);
			}else if(command.equals("bookInsert")){
				bookInsert(request, response);
			}else if(command.equals("bookUpdate")){
				bookUpdate(request, response);
			}else if(command.equals("bookDelete")){
				bookDelete(request, response);
			}else if(command.equals("bookInfo")){
				bookInfo(request, response);
			}else if(command.equals("bookAllInfo")){
				bookAllInfo(request, response);
			}else if(command.equals("bookAllInfo2")){
				bookAllInfo2(request, response);
			}else if(command.equals("rentInsert")){
				rentInsert(request, response);
			}else if(command.equals("rentDelete")){
				rentDelete(request, response);
			}else if(command.equals("rentAllInfo")){
				rentAllInfo(request, response);
			}else if(command.equals("logout")){
				Logout(request, response);
			}
		}catch (Exception e){
			request.setAttribute("errorMsg", e.getMessage());
			request.getRequestDispatcher("showError.jsp").forward(request, response);
			e.printStackTrace();
		}
	}
	
	public void Login (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = null;
		String url = "showError.jsp";
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		try {
			if(EbookModel.isMember(id, pw)) {
				session = request.getSession();
				session.setAttribute("id",id);
				url = "main.jsp";
			}else {
				request.setAttribute("errorMsg", "회원 정보가 존재하지 않습니다.");
			}
		}catch (Exception e) {
			request.setAttribute("errorMsg", e.getMessage());
			e.printStackTrace();
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
	
	//회원 정보 CRUD
	public void memberInsert (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "showError.jsp";
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String mdate = new SimpleDateFormat("yy-mm-dd").format(new Date());
		int maxloan = 0;
		
		MemberDTO member = new MemberDTO(id, pw, name, mdate, maxloan);
		
		try {
			if(EbookModel.addMember(member)) {
				request.setAttribute("member", member);
				request.setAttribute("successMsg", "가입 완료");
				url = "main.jsp";
			}else {
				request.setAttribute("errorMsg", "다시 시도하세요");
			}
		}catch (Exception e) {
			request.setAttribute("errorMsg", e.getMessage());
			e.printStackTrace();
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
	
	public void memberUpdate (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String url = "showError.jsp";
		
		String id = (String)session.getAttribute("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
	
		try {
			if(EbookModel.updateMember(id, pw, name)) {
				request.setAttribute("successMsg", "수정 완료");
				url = "main.jsp";
			}else {
				request.setAttribute("errorMsg", "다시 시도하세요");
			}
		}catch (Exception e) {
			request.setAttribute("errorMsg", e.getMessage());
			e.printStackTrace();
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

	public void memberDelete (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String url = "showError.jsp";
		
  String id = (String)session.getAttribute("id");
  String pw = request.getParameter("pw");
	
		try {
			if(EbookModel.deleteMember(id, pw)) {
				request.setAttribute("successMsg", "삭제 완료");
				url = "main.jsp";
			}else {
				request.setAttribute("errorMsg", "다시 시도하세요");
			}
		}catch (Exception e) {
			request.setAttribute("errorMsg", e.getMessage());
			e.printStackTrace();
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
	
	public void memberInfo (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String url = "showError.jsp";
		
		String id = (String)session.getAttribute("id");
	
		try {
			MemberDTO member = EbookModel.getMember(id);
			if(member != null) {
				request.setAttribute("member", member);
				url = "main.jsp";
			}else {
				request.setAttribute("errorMsg", "다시 시도하세요");
			}
		}catch (Exception e) {
			request.setAttribute("errorMsg", e.getMessage());
			e.printStackTrace();
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
	
	
	
	//책 정보 CRUD
		public void bookInsert (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			HttpSession session = request.getSession();
			String url = "showError.jsp";
			
			String id = (String)session.getAttribute("id");
			String bid = request.getParameter("bid");
			int isbn = Integer.parseInt(request.getParameter("isbn"));
			String bname = request.getParameter("bname");
			String quthor = request.getParameter("bname");
			String publisher = request.getParameter("publisher");
			String bdate = request.getParameter("bdate");
			int bcnt = Integer.parseInt(request.getParameter("bcnt"));
			
			BookDTO book = new BookDTO(bid, isbn, bname, quthor, publisher, bdate, bcnt);
			
			try {
				if(EbookModel.addBook(id, book)) {
					request.setAttribute("book", book);
					request.setAttribute("successMsg", "등록 완료");
					url = "main.jsp";
				}else {
					request.setAttribute("errorMsg", "다시 시도하세요");
				}
			}catch (Exception e) {
				request.setAttribute("errorMsg", e.getMessage());
				e.printStackTrace();
			}
			request.getRequestDispatcher(url).forward(request, response);
		}
		
		public void bookUpdate (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			HttpSession session = request.getSession();
			String url = "showError.jsp";
			
			String id = (String)session.getAttribute("id");
			String bid = request.getParameter("bid");
			int bcnt = Integer.parseInt(request.getParameter("bid"));
		
			try {
				if(EbookModel.updateBook(id, bid, bcnt)) {
					request.setAttribute("successMsg", "수정 완료");
					url = "main.jsp";
				}else {
					request.setAttribute("errorMsg", "다시 시도하세요");
				}
			}catch (Exception e) {
				request.setAttribute("errorMsg", e.getMessage());
				e.printStackTrace();
			}
			request.getRequestDispatcher(url).forward(request, response);
		}
		
		public void bookDelete (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			HttpSession session = request.getSession();
			String url = "showError.jsp";
			
			String id = (String)session.getAttribute("id");
			String bid = request.getParameter("bid");
		
			try {
				if(EbookModel.deleteBook(id, bid)) {
					request.setAttribute("successMsg", "삭제 완료");
					url = "main.jsp";
				}else {
					request.setAttribute("errorMsg", "다시 시도하세요");
				}
			}catch (Exception e) {
				request.setAttribute("errorMsg", e.getMessage());
				e.printStackTrace();
			}
			request.getRequestDispatcher(url).forward(request, response);
		}
		
		public void bookInfo (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String url = "showError.jsp";
			
			String bname = request.getParameter("bname");
		
			try {
				BookDTO book = EbookModel.getBook(bname);
				if(book != null) {
					request.setAttribute("book", book);
					url = "main.jsp";
				}else {
					request.setAttribute("errorMsg", "다시 시도하세요");
				}
			}catch (Exception e) {
				request.setAttribute("errorMsg", e.getMessage());
				e.printStackTrace();
			}
			request.getRequestDispatcher(url).forward(request, response);
		}
		
		public void bookAllInfo (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String url = "showError.jsp";
			System.out.println("---=-=-=-=-=");
			
			try {
				ArrayList<BookDTO> books = EbookModel.getAllBooks();
				if(books != null) {
					request.setAttribute("books", books);
					url = "showbooks.jsp";
				}else {
					request.setAttribute("errorMsg", "다시 시도하세요");
				}
			}catch (Exception e) {
				request.setAttribute("errorMsg", e.getMessage());
				e.printStackTrace();
			}
			request.getRequestDispatcher(url).forward(request, response);
		}
				
		public void bookAllInfo2 (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String url = "showError.jsp";
			System.out.println("---=-=-=-=-=");
			try {
				ArrayList<BookDTO> books = EbookModel.getAllBooks();
				if(books != null) {
					request.setAttribute("books", books);
					url = "showbooks2.jsp";
				}else {
					request.setAttribute("errorMsg", "다시 시도하세요");
				}
			}catch (Exception e) {
				request.setAttribute("errorMsg", e.getMessage());
				e.printStackTrace();
			}
			request.getRequestDispatcher(url).forward(request, response);
		}
		
		
		
		
		
		//대출 정보 CRUD
		public void rentInsert (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			HttpSession session = request.getSession();
			String url = "showError.jsp";
			
			
			String id = (String)session.getAttribute("id");
			String bid = request.getParameter("bid");
		
			try {
				if(EbookModel.addRent(id, bid)) {
					request.setAttribute("successMsg", "등록 완료");
					url = "main.jsp";
				}else {
					request.setAttribute("errorMsg", "다시 시도하세요");
				}
			}catch (Exception e) {
				request.setAttribute("errorMsg", e.getMessage());
				e.printStackTrace();
			}
			request.getRequestDispatcher(url).forward(request, response);
		}

		
		public void rentDelete (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String url = "showError.jsp";
			
			String rid = request.getParameter("rid");
		
			try {
				if(EbookModel.deleteRent(rid)) {
					request.setAttribute("successMsg", "삭제 완료");
					url = "main.jsp";
				}else {
					request.setAttribute("errorMsg", "다시 시도하세요");
				}
			}catch (Exception e) {
				request.setAttribute("errorMsg", e.getMessage());
				e.printStackTrace();
			}
			request.getRequestDispatcher(url).forward(request, response);
		}
	
		public void rentAllInfo (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String url = "showError.jsp";
			
			try {
				ArrayList<RentDTO> rents = EbookModel.getAllRents();
				if(rents != null) {
					request.setAttribute("rents", rents);
					url = "rent.jsp";
				}else {
					request.setAttribute("errorMsg", "다시 시도하세요");
				}
			}catch (Exception e) {
				request.setAttribute("errorMsg", e.getMessage());
				e.printStackTrace();
			}
			request.getRequestDispatcher(url).forward(request, response);
		}
	
			
		public void Logout (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String url = "showError.jsp";
			try {
			}catch (Exception e) {
				request.setAttribute("errorMsg", e.getMessage());
				e.printStackTrace();
			}
			request.getRequestDispatcher(url).forward(request, response);
		}
		
}
