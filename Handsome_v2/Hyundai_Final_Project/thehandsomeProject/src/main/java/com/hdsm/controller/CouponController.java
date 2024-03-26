package com.hdsm.controller;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hdsm.service.CouponService;
import com.hdsm.service.EventService;
import com.hdsm.service.KakaoService;


@Controller
public class CouponController {
    @Autowired
    CouponService couponService;

    @Autowired
    EventService eventService;

    @Autowired
    private KakaoService ks;


    int seq = 1;


    @ResponseBody
    @PostMapping("/event/eventdetail")
    public String insertCoupon(@RequestParam("eid") Integer eid, Principal principal, HttpSession session) throws Exception {
/*        String access_Token = (String) session.getAttribute("kakaoToken");
        String sns_mid = "";
        if (access_Token != null) {
            HashMap<String, Object> userInfo = ks.getUserInfo(access_Token);
            sns_mid = (String) userInfo.get("email");
        }*/
        String member_mid = principal.getName();

        int checkValid = couponService.getUserInfoForCoupon(member_mid, eid);

        if (member_mid != null) {
            if (checkValid == 0) {
                couponService.eventCoupon(member_mid + eid, eid, member_mid, eventService.getEventDetail(eid).getEname());
                return "success";	
            } else {
                return "overlap";
            }
        } else {
            return "checked_login";
        }


    }
}
