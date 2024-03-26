package com.hdsm.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hdsm.domain.member.MemberDTO;
import com.hdsm.domain.order.Criteria;
import com.hdsm.service.order.OrderService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/order/*")
public class OrderController {
	@Autowired
	OrderService orderservice;
	
	@RequestMapping("/canclelist")
	public String OrderCanclelist(Model model, HttpSession session) {
		List<Map<String, Object>> list = orderservice.getOrderStatus();		
		model.addAttribute("orderlist", orderservice.getList());
		model.addAttribute("status1", list.get(0).get("COUNT"));
		model.addAttribute("status2", list.get(1).get("COUNT"));
		model.addAttribute("status3", list.get(2).get("COUNT"));
		model.addAttribute("status4", list.get(3).get("COUNT"));
		model.addAttribute("status5", list.get(4).get("COUNT"));
		model.addAttribute("status6", list.get(5).get("COUNT"));
		
		return "order/canclelist";
	}
	
	@PostMapping("/canclepayment")
	@ResponseBody
	public String userPaymentCancle(@RequestParam("imp_uid")String imp_uid) {
		orderservice.paymentCancleOrder(imp_uid);
		return "success";
	}
	
	@RequestMapping("/statuslist")
	public String OrderStatuslist(Criteria cri, Model model, HttpSession session) {
		List<Map<String, Object>> list = orderservice.getOrderStatus();
		model.addAttribute("orderlist", orderservice.getList());
		model.addAttribute("status1", list.get(0).get("COUNT"));
		model.addAttribute("status2", list.get(1).get("COUNT"));
		model.addAttribute("status3", list.get(2).get("COUNT"));
		model.addAttribute("status4", list.get(3).get("COUNT"));
		model.addAttribute("status5", list.get(4).get("COUNT"));
		model.addAttribute("status6", list.get(5).get("COUNT"));
		
		return "order/statuslist";
	}	
	
	@PostMapping("/statuschange")
	@ResponseBody
	public String userPaymentCancle(@RequestParam("oid")String oid, @RequestParam("ostatus")String ostatus) {
		int user_ostatus = Integer.parseInt(ostatus);
		orderservice.StatusChangeOrderUser(oid, user_ostatus);
		return "success";
	}
}
