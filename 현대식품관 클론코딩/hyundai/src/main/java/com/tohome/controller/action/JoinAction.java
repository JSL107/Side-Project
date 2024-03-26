package com.tohome.controller.action;

import com.tohome.dao.BasketDAO;
import com.tohome.dao.MemberDAO;
import com.tohome.dto.MemberDTO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

//Written  by 여명, 승준
public class JoinAction implements Action{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String url = "TohomeServlet?command=main";
        
        
        HttpSession session =request.getSession();//jsp와 다르게 java file에서 session 사용할때는 객체를 만들고 다뤄야함
        
        // 회원가입 폼으로부터 받은 값들
        String userId = request.getParameter("id");
        String userPwd = request.getParameter("pwd");
        String userName = request.getParameter("name");
        String bithYMD = request.getParameter("birth_ymd");
        String mobileNum = request.getParameter("mobile_num");
        String gender = request.getParameter("gender");
        String addressMain = request.getParameter("main_address");
        String addressDetail = request.getParameter("address_detail");
        String addressName = request.getParameter("address_name");
        
        MemberDAO dao = MemberDAO.getInstance();//static으로 선언해서 바로 가져오기 가능
        MemberDTO memberDTO = dao.memberJoin(
                userId, userPwd, userName, bithYMD, mobileNum, gender, addressMain, addressDetail, addressName
        );// 받아온 회원가입 정보들을 memberJoin함수에 인자로 넣음
        
        
        BasketDAO bdao =  BasketDAO.getInstance();//회원에 장바구니담긴 갯수를 알기위해서 basketDAO 인스턴스 가져옴
        int basketCount = bdao.CountBasketItem(memberDTO.getUser_no());// CountBasketItem함수로 갯수를 반환받음
        
        // 회원가입후 자동으로 로그인이 되므로 LoginAction과 동일하게 session을 만들어줌
        if (memberDTO.getUser_id() != null) {
            // 로그인 성공에 따른 session값들을 넣어줌
            session.setAttribute("UserId", memberDTO.getUser_id());
            session.setAttribute("UserName", memberDTO.getUser_name());
            session.setAttribute("UserNo", memberDTO.getUser_no());
            System.out.println(memberDTO.getUser_no());
            session.setAttribute("basketCount", basketCount);
        }
        
        request.getRequestDispatcher(url).forward(request, response);
    }
}
