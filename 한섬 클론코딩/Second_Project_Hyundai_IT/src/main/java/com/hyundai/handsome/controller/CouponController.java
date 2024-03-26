package com.hyundai.handsome.controller;

import com.hyundai.handsome.service.CouponService;
import com.hyundai.handsome.service.EventService;
import com.hyundai.handsome.service.MemberService;
import com.hyundai.handsome.vo.MemberVO;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

/**
 * CouponController
 *
 * @author 이준석
 * @since 10.27
 * <p>
 * <p>
 * 수정일                 수정자                         수정내용
 * ----------  ---------------    ---------------------------
 * 2022.10.05	  이준석			최초 생성
 * 2022.10.11     이준석         마이페이지에서 어떤 쿠폰을 발행 받았는지 알려주는 링크 구현
 * 2022.10.27     이준석          security 적용
 */

@Controller
@AllArgsConstructor
public class CouponController {

    @Autowired
    MemberService memberService;
    @Autowired
    CouponService couponService;

    @Autowired
    EventService eventService;

    // 쿠폰리스트 가져오기
    @GetMapping("member/mycoupons")
    public void getCouponList(HttpServletRequest request, Model model, Principal prin) throws Exception {
        String mid = prin.getName();
        model.addAttribute("coupon", couponService.getCouponList(mid));

    }
}
