package com.hdsm.controller;

import java.util.List;
import java.util.Objects;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.hdsm.domain.OrderItemVO;
import com.hdsm.domain.OrderListVO;
import com.hdsm.domain.OrderUserVO;
import com.hdsm.service.CouponService;
import com.hdsm.service.EventService;
import com.hdsm.service.MemberService;
import com.hdsm.service.OrderService;
import com.hdsm.service.ProductService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/order/*")
public class OrderController {

    @Autowired
    MemberService memberservice;

    @Autowired
    ProductService productservice;

    @Autowired
    CouponService couponService;

    @Autowired
    EventService eventService;

    @Autowired
    OrderService orderservice;

    //order_page로 이동
    @PostMapping("/order_page")
    public void order_page(OrderListVO olvo, @RequestParam(required = false) String tocart, @RequestParam(value = "price", required = false) String rafflePrice, Model model, HttpServletRequest request) {
    	

        //세션을  선언
        HttpSession session = request.getSession();
        System.out.println((String) session.getAttribute("member"));
        //해당하는 주문 상품들을 모아둠
        List<OrderItemVO> orders = olvo.getOrders();

        //회원이 가지고 있는 쿠폰 정보를 가져옴.
        model.addAttribute("couponList", orderservice.getcouponwithevent((String) session.getAttribute("member")));

        //회원의 정보를 가져옴
        model.addAttribute("member", memberservice.getMember((String) session.getAttribute("member")));

        //회원이 주문한 상품에 대한 빠진 정보들을 설정한다.
        model.addAttribute("orderList", orderservice.getOrderPageInfo(orders));

        //장바구니에서 주문페이지로 왔는지 확인하기 위해 필요
        model.addAttribute("tocart", tocart);



        //총 포인트
        int realTotalPoint = 0;
        //총 가격
        int realTotalPrice = 0;
        //총 마일리지
        int realMilege = 0;

        //총합은 각각 상품들의 합계를 더한것과 같다.
        for (int i = 0; i < orders.size(); i++) {
            realTotalPoint += orders.get(i).getTotalpoint();
            realTotalPrice += orders.get(i).getTotalprice();
            realMilege += orders.get(i).getMilege();
        }


        //포인트의 총합이나 가격을 실제 마일리지를 model로 보낸다.
        model.addAttribute("realTotalPoint", realTotalPoint);
        model.addAttribute("realTotalPrice", realTotalPrice);
        model.addAttribute("realMilege", realMilege);
        model.addAttribute("addressList", orderservice.getAddress((String) session.getAttribute("member")));
        if (rafflePrice != null) {
            model.addAttribute("rafflePrice", rafflePrice);
        }

    }

    //주문 실행
    @PostMapping("/orderexec")
    public ResponseEntity<Void> orderexec(@RequestBody OrderUserVO ouv, HttpServletRequest request) {

        //주문한 회원정보를 등록

        if (ouv.getCcode() != null || !Objects.equals(ouv.getCcode(), "")) {
            couponService.useCoupon(ouv.getCcode());
        }
        orderservice.insertOrderUser(ouv);

        //주문한 회원 상품들을 등록
        orderservice.insertOrderProduct(ouv);

        //장바구니로부터 주문이 받아진 거라면 해당하는 장바구니를 제거
        if (ouv.getTocart().equals("true")) {
            //카트로 등록되어진 상품들을 제거
            orderservice.deleteShoppingbag(ouv);

        }


        //지불 방식이 신용카드이거나 현대카드 레드 바우쳐일 경우 마일리지를 갱신한다.
        orderservice.insertMileage(ouv);


        System.out.println(ouv.getMid());
        //hsPoint 값을 업데이트
        orderservice.updateHspoint(ouv);

        //객체로 받았기 때문에 똑같은 객체로  return
        return new ResponseEntity<Void>(HttpStatus.OK);
    }

    //주문을 성공할 경우 수행
    @PostMapping("/ordersuccess")
    public void orderconfirmation(@RequestParam(value = "oid") String oid, Model model, HttpServletRequest request , @RequestParam(value = "rafflePrice", required = false) String price) {

        if (price!=null) {
            model.addAttribute("rafflePrice", price);
            System.out.println("rafflePrice : " + price);
        }
        
        //주문 번호에 대해 주문한 사용자의 정보를 조회
        OrderUserVO orderuserlist = orderservice.getOrderUserItem(oid);

        //그 사용자를 model을 통해 보냄
        model.addAttribute("orderuserlist", orderuserlist);

        //사용자가 주문한 상품들의 리스트를 저장할 객체를 선언
        List<OrderItemVO> oiv = orderuserlist.getOrders();


        HttpSession session = request.getSession();


        //총 포인트
        int realTotalPoint = 0;

        //상품 합계
        int realTotalPrice = 0;

        //총 마일리지
        int realMilege = 0;

        //결제 금액
        int realTotalsum = 0;

        //상품들의 총합을 통해 각각의  총 합계를 가져와서 더한다.
        for (int i = 0; i < oiv.size(); i++) {
            realTotalPoint += oiv.get(i).getTotalpoint();
            realTotalPrice += oiv.get(i).getOprice();
            realMilege += oiv.get(i).getMilege();
        }

        //바뀐 장바구니 갯수 !
        int count = memberservice.getShoppingBagCount((String) session.getAttribute("member"));
        session.setAttribute("sbCount", count);// 바뀐 장바구니 갯수 다시 세서 가져오기

        //결제 금액은 할인 가격도 있기 때문에 계산해준다.
        realTotalsum = realTotalPrice - orderuserlist.getOdiscounted();

        //회원 정보를 가져오는 member
        model.addAttribute("member", memberservice.getMember((String) session.getAttribute("member")));

        //총 포인트를 넘겨주는 realTotalPrice
        model.addAttribute("realTotalPoint", realTotalPoint);
        //총 가격을 넘겨주는 realTotalPrice
        model.addAttribute("realTotalPrice", realTotalPrice);
        //결제 금액을 넘겨주는 realTotalsum
        model.addAttribute("realTotalsum", realTotalsum);
        //총 마일리지를 넘겨주는 realMilege
        model.addAttribute("realMilege", realMilege);

        //등록되어있는 주소들이 담겨져 있는 addressList
        model.addAttribute("addressList", orderservice.getAddress((String) session.getAttribute("member")));


    }

    //주문을 취소
    @PostMapping("/ordercancel")
    public String orderCancel(String oid, HttpServletRequest request) {
        HttpSession session = request.getSession();
        OrderUserVO ouv = orderservice.getOrderInfo((String) session.getAttribute("member"), oid);
        //바뀐 장바구니 갯수 !
        int count = memberservice.getShoppingBagCount((String) session.getAttribute("member"));

        if (ouv.getOusedcoupon() == 1) {
            couponService.useCancel(ouv.getCcode());
        }

        //주문한 사용자의 정보를 제거하는 서비스 실행
        orderservice.deleteOrderUser(oid);


        session.setAttribute("sbCount", count);// 바뀐 장바구니 갯수 다시 세서 가져오기

        //삭제를 했기 때문에 redirect를 통해 페이지를 갱신한다.
        return "redirect:/member/orderlist";
    }


}