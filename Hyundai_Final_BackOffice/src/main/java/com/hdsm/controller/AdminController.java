package com.hdsm.controller;

import com.hdsm.domain.member.MemberDTO;
import com.hdsm.service.member.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.util.List;
import java.util.Map;
import java.util.Objects;


@Controller
@RequestMapping("/admin/*")
public class AdminController {
    @Autowired
    MemberService memberService;

    @GetMapping("/login")
    public String login(HttpServletRequest request) {
    	HttpSession session = request.getSession();
    	if(session.getAttribute("mid")!=null) {    		
    		session.invalidate();
    		return "redirect:/admin/login";
    	}
    	else {    		
        	return "/admin/login";
    	}
    	
    }

    @PostMapping("/login")
    public String loginPost(MemberDTO memberDTO, HttpServletRequest request, HttpSession session) throws Exception {
        BCryptPasswordEncoder encode = new BCryptPasswordEncoder();
        String mid = request.getParameter("input_id");
        String mpwd = request.getParameter("input_pw");
        if (mid != null && mpwd != null || !Objects.equals(mid, "") && !Objects.equals(mpwd, "")) {
            boolean checkpw = encode.matches(mpwd, memberService.read(mid));
            session.setAttribute("mid", mid);
            if (checkpw && memberService.adminLogin(mid) != null) {
                return "redirect:/admin/home";
            } else {
                return "redirect:/admin/login";
            }
        } else {
            return "redirect:/admin/login";
        }
    }
    
    /* 메인페이지 로그아웃 */
    @GetMapping("/logout")
    public String logoutMainGET(HttpServletRequest request) throws Exception{
                        
        HttpSession session = request.getSession();
        
        session.invalidate();
        
        return "redirect:/admin/login";        
        
    }
    
    @GetMapping("/home")
    public void home(Model model, HttpSession session) {
        MemberDTO dto = memberService.adminLogin((String) session.getAttribute("mid"));
        int total_user = memberService.countTotalUser();
        int man_user = memberService.countMan();
        int woman_user = memberService.countWoman();
        List<Map<String, Object>> list = memberService.getAgeRange();
        
    
        model.addAttribute("admin_id", dto.getMid());
        model.addAttribute("total_user", total_user);
        model.addAttribute("man_count", man_user);
        model.addAttribute("woman_count",woman_user);
        model.addAttribute("ageRange", list);
        model.addAttribute("ages10", list.get(0).get("COUNT"));
        model.addAttribute("ages20", list.get(1).get("COUNT"));
        model.addAttribute("ages30", list.get(2).get("COUNT"));
        model.addAttribute("ages40", list.get(3).get("COUNT"));
        model.addAttribute("ages50", list.get(4).get("COUNT"));
        model.addAttribute("ages60", list.get(5).get("COUNT"));
        model.addAttribute("ages70", list.get(6).get("COUNT"));
        model.addAttribute("ages80", list.get(7).get("COUNT"));
        model.addAttribute("orderCount", memberService.getTodayOrderCount());
        model.addAttribute("orderSales", memberService.getTodayOrderSales());
        
        
        List<Map<String, Object>> monthlist = memberService.getMonthlyjoin();        
        model.addAttribute("month1", monthlist.get(0).get("COUNT"));
        model.addAttribute("month2", monthlist.get(1).get("COUNT"));
        model.addAttribute("month3", monthlist.get(2).get("COUNT"));
        model.addAttribute("month4", monthlist.get(3).get("COUNT"));
        model.addAttribute("month5", monthlist.get(4).get("COUNT"));
        model.addAttribute("month6", monthlist.get(5).get("COUNT"));
        model.addAttribute("month7", monthlist.get(6).get("COUNT"));
        model.addAttribute("month8", monthlist.get(7).get("COUNT"));
        model.addAttribute("month9", monthlist.get(8).get("COUNT"));
        model.addAttribute("month10", monthlist.get(9).get("COUNT"));
        model.addAttribute("month11", monthlist.get(10).get("COUNT"));
        model.addAttribute("month12", monthlist.get(11).get("COUNT"));

    }
}
