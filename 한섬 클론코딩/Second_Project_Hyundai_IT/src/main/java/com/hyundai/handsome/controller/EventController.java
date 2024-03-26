package com.hyundai.handsome.controller;

import java.security.Principal;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hyundai.handsome.service.CouponService;
import com.hyundai.handsome.service.EventService;
import com.hyundai.handsome.service.MemberService;
import com.hyundai.handsome.vo.MemberVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/**
 * EventController
 *
 * @author 이준석, 김찬중
 * @since 10.27
 * <p>
 * <p>
 * 수정일                 수정자                         수정내용
 * ----------  ---------------    ---------------------------
 * 2022.10.05	  이준석			    최초 생성
 * 2022.10.14     이준석             기능구현
 * 2022.10.27     이준석, 김찬중      security 적용
 */

@AllArgsConstructor
@Controller
@RequestMapping(value = "/event")
public class EventController {

    @Autowired
    private EventService eventService;

    @Autowired
    private CouponService couponService;

    //    이벤트 리스트 페이지 접속
    @RequestMapping(value = "/eventlist", method = RequestMethod.GET)
    public void getEventList(Model model) throws Exception {
        model.addAttribute("edata", eventService.getEventList());
    }

    //    이벤트 상세페이지 접속
    @RequestMapping(value = "eventdetail", method = RequestMethod.GET)
    public void getEventDetail(@RequestParam("eid") Integer eid, Model model) throws Exception {
        model.addAttribute("eid", eventService.getEventDetail(eid).getEid());
        model.addAttribute("ename", eventService.getEventDetail(eid).getEname());
        model.addAttribute("estartdate", eventService.getEventDetail(eid).getEstartdate());
        model.addAttribute("eenddate", eventService.getEventDetail(eid).getEenddate());
        model.addAttribute("eimage", eventService.getEventDetail(eid).getEimage());
    }

    //    이벤트 상세페이지에서 쿠폰받기 버튼을 통해 회원에게 쿠폰 발행
    @ResponseBody
    @RequestMapping(value = "/eventdetail", method = RequestMethod.POST)
    public String eventCoupon(@RequestParam("eid") Integer eid, Principal prin) throws Exception {
        String mid = prin.getName();
//        쿠폰의 형식 만들어주는 메서드
        couponService.eventCoupon("coupon" + new Date(), eventService.getEventDetail(eid).getEid(), mid, eventService.getEventDetail(eid).getEname());
        return "success";
    }


}
