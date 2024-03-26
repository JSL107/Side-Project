package com.hyundai.handsome.controller;

import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.hyundai.handsome.service.CartService;
import com.hyundai.handsome.service.CouponService;
import com.hyundai.handsome.service.OrderService;
import com.hyundai.handsome.service.ProductService;
import com.hyundai.handsome.vo.CartVO;
import com.hyundai.handsome.vo.MemberVO;
import com.hyundai.handsome.vo.OrderViewVO;
import com.hyundai.handsome.vo.ProductVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

//작성자 - 이준석
@RestController
@RequestMapping("/order")
@AllArgsConstructor
public class OrderPostController {

    @Autowired
    OrderService orderService;

    @Autowired
    CartService cartService;

    @Autowired
    ProductService productService;

    @Autowired
    CouponService couponService;

    //작성자 : 이준석
    @PostMapping("/ordering")
//    OrderItem 테이블과 OrderList 테이블에 들어가는 인자값들
//    [OrderList] : 지번, 주소, 상세주소, 수령인, Parsing된 휴대폰 번호 1,2,3, 사용된 포인트, 사용된 쿠폰, 상품코드, 어떤 결제방식을 이용하였는지, 할인금액
//    [OrderItem] : 상품번호, 색상, 사이즈, 총 수량, 세션에 저장되어 있는 Security 토큰 아이디 값을 가져오기 위한  HttpServletRequest, 주문완료 후 이동하는 페이지 선언을 위한 HttpServletResponse
    public void postOrder(@RequestParam("ozipcode") Integer ozipcode, @RequestParam("oaddress1") String oaddress1, @RequestParam("oaddress2") String oaddress2, @RequestParam("oreceiver") String oreceiver, @RequestParam("phNum1") String phNum1, @RequestParam("phNum2") String phNum2, @RequestParam("phNum3") String phNum3, @RequestParam("ousedpoint") Integer ousedpoint, @RequestParam("ousedcoupon") String ccode, @RequestParam("opayment") Integer opayment, @RequestParam("odiscounted") Integer odiscounted, @RequestParam("pid") String pid, @RequestParam("ccolorcode") String ccolorcode, @RequestParam("ssize") String ssize, @RequestParam("oamount") Integer oamount, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {

        // 세션에 저장되어있는 토큰 아이디값
        MemberVO lvo = (MemberVO) request.getSession().getAttribute("member");
//        세션에 저장되어있는 지정된 아이템 길이
        int itemsLength = (int) session.getAttribute("itemsLength");
//        Parsing된 휴대폰 번호 합쳐서 DB에 저장하기 위한 코드
        String hp = phNum1 + phNum2 + phNum3;
//        아이템 길이가 1보다 크면 장바구니에 담긴 상품 구매, 그것이 아니라면 바로 주문
        if (itemsLength > 1) {
            String checkedItems = (String) request.getSession().getAttribute("cartToOrder");
            StringTokenizer st = new StringTokenizer(checkedItems, ",");
            orderService.addOrderList(lvo.getMid(), ozipcode, oaddress1, oaddress2, oreceiver, hp, couponService.getCouponEid(ccode), ousedpoint, opayment, 0, odiscounted);
//           장바구니에서 들어오는 주문
            for (int i = 0; i < itemsLength; i++) {
                int cid = Integer.parseInt(st.nextToken());
                CartVO cart = cartService.cartSelect(cid);
                ProductVO product = productService.productGetDetail(cart.getPid(), cart.getPcolor());
                OrderViewVO order = new OrderViewVO();
                orderService.addOrderItem(cart.getPid(), cart.getPcolor(), cart.getPsize(), cart.getPamount());
            }

//      바로주문에서 주문
        } else {
            orderService.addOrderList(lvo.getMid(), ozipcode, oaddress1, oaddress2, oreceiver, hp, ousedpoint, couponService.getCouponEid(ccode), opayment, 0, odiscounted);
            orderService.addOrderItem(pid, ccolorcode, ssize, oamount);
        }
        response.sendRedirect("/member/mypage?&pid=" + pid);
    }

}
