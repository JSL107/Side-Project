package com.hyundai.handsome.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.hyundai.handsome.service.CartService;
import com.hyundai.handsome.service.CouponService;
import com.hyundai.handsome.service.EventService;
import com.hyundai.handsome.service.MemberService;
import com.hyundai.handsome.service.OrderService;
import com.hyundai.handsome.service.ProductService;
import com.hyundai.handsome.vo.CartVO;
import com.hyundai.handsome.vo.MemberVO;
import com.hyundai.handsome.vo.OrderViewVO;
import com.hyundai.handsome.vo.ProductVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

// 작성자 : 이준석, 김가희, 김나형
@Log4j
@Controller
@RequestMapping(value = "/order")
@AllArgsConstructor
public class OrderController {

    @Autowired
    OrderService orderService;

    @Autowired
    MemberService memberService;

    @Autowired
    CouponService couponService;

    @Autowired
    EventService eventService;

    @Autowired
    ProductService productService;

    @Autowired
    CartService cartService;

    //    이준석 - 바로주문
    @GetMapping("/orderpage")
//    인자값으로 pid, 상품수량, 색상, 크기를 담고 session에 저장되어있는 현재 로그인한 유저의 정보를 얻기 위해 HttpServeletRequest 선언
    public void getProductDetail(@RequestParam("pid") String pid, @RequestParam("amount") Integer amount, @RequestParam("ccolorcode") String ccolorcode, @RequestParam("ssize") String ssize, HttpServletRequest request, Model model, HttpSession session) throws Exception {
        MemberVO lvo = (MemberVO) request.getSession().getAttribute("member");
//        뷰 : order_view에 담겨있는 데이터 값을 model에 담기
        model.addAttribute("orderinfo", orderService.getOrderInfo(lvo.getMid(), pid, ccolorcode, ssize));
        model.addAttribute("amount", amount);
//        주문 수량 * 상품가격으로 총 금액 구하기
        model.addAttribute("totalPrice", amount * orderService.getOrderInfo(lvo.getMid(), pid, ccolorcode, ssize).getPprice());
        model.addAttribute("couponList", couponService.getCouponList(lvo.getMid()));
        model.addAttribute("ssize", ssize);
        model.addAttribute("ccolorcode", ccolorcode);
        model.addAttribute("pid", pid);
        model.addAttribute("mid", request.getParameter(lvo.getMid()));
        model.addAttribute("oamount", String.valueOf(amount));
        model.addAttribute("mPoint", lvo.getMpoint());
//        페이지의 input이 두개로 나누어져 있어 데이터를 Parsing 하는 부분
        model.addAttribute("middlePhoneNum", orderService.getOrderInfo(lvo.getMid(), pid, ccolorcode, ssize).getMtel().substring(3, 7));
        model.addAttribute("endPhoneNum", orderService.getOrderInfo(lvo.getMid(), pid, ccolorcode, ssize).getMtel().substring(7, 11));
        model.addAttribute("parsingemail1", orderService.getOrderInfo(lvo.getMid(), pid, ccolorcode, ssize).getMemail().split("@")[0]);
        model.addAttribute("parsingemail2", orderService.getOrderInfo(lvo.getMid(), pid, ccolorcode, ssize).getMemail().split("@")[1]);
//        세션값에 바로주문인지 장바구니에서 주문인지를 구분하기 위한 아이템의 총길이 저장
        session.setAttribute("itemsLength", 1);
    }

    /* 김가희 김나형 - 장바구니에서 주문 */
    @PostMapping("/cartToOrder")
    public String cartToOrder(HttpServletRequest request, @RequestParam(value = "chbox[]") List<String> chArr, Model model, HttpSession session) throws Exception {
        String str = "";
        log.info("chArr: "+chArr);
        for (String s : chArr) {
            str += s + ",";
        }
        session.setAttribute("cartToOrder", str);
        session.setAttribute("itemsLength", chArr.size());
        return "redirect:/order/orderList";
    }

    // 장바구니에 담긴 상품들을 주문하기에서 나타내기
    @GetMapping("/orderList")
    public void orderList(Model model, HttpSession session, HttpServletRequest request) throws Exception {
        MemberVO lvo = (MemberVO) request.getSession().getAttribute("member");

        // 세션에 저장되어있는 체크 된 아이템 값들을 불러오기 
        String checkedItems = (String) session.getAttribute("cartToOrder");
//        StringTokenizer를 이용하여 값을 Parsing
        StringTokenizer st = new StringTokenizer(checkedItems, ",");
        List<OrderViewVO> orderList = new ArrayList<>();
//        세션에서 총 선택한 아이템의 개수 불러오기
        int itemsLength = (int) session.getAttribute("itemsLength");
        //전체주문금액
        int orderTotal = 0; 
//        총 아이템의 수만큼 VO객체에 데이터들 삽입
        for (int i = 0; i < itemsLength; i++) {
            int cid = Integer.parseInt(st.nextToken());
            CartVO cart = cartService.cartSelect(cid);
            ProductVO product = productService.productGetDetail(cart.getPid(), cart.getPcolor());
            OrderViewVO order = new OrderViewVO();
            order.setBname(product.getBname());
            order.setCcolorname(product.getCcolorcode());
            order.setCimage3(product.getCimage3());
            order.setPname(product.getPname());
            order.setPprice(product.getPprice() * cart.getPamount());
            order.setSsize(cart.getPsize());
            order.setPamount(cart.getPamount());
            order.setMemail(lvo.getMemail());
            order.setMname(lvo.getMname());
            order.setMpoint(Integer.parseInt(lvo.getMpoint()));
            order.setMtel(lvo.getMtel());

            orderList.add(order);
            orderTotal += (product.getPprice() * cart.getPamount());
        }
        model.addAttribute("orderList", orderList);
        model.addAttribute("orderTotal", orderTotal);
        //구매시 적립될 포인트
        //회원이 가진 포인트
        model.addAttribute("mPoint", lvo.getMpoint());
        model.addAttribute("middlePhoneNum", lvo.getMtel().substring(3, 7));
        model.addAttribute("endPhoneNum", lvo.getMtel().substring(7, 11));
        model.addAttribute("parsingemail1", lvo.getMemail().split("@")[0]);
        model.addAttribute("parsingemail2", lvo.getMemail().split("@")[1]);
        model.addAttribute("couponList", couponService.getCouponList(lvo.getMid()));
    }

    @GetMapping("/ordercomplete")
    public void orderCompleteGet() {
    }
}
