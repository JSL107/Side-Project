package com.hdsm.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hdsm.service.PageCounterService;

@Controller
public class PageCountController {
	@Autowired
	PageCounterService pageservice;
	
	
	@PostMapping("/countEventListner")
	@ResponseBody
	public String getClosetCounter(@RequestParam("closetcounter")String closet, 
				@RequestParam("makeupcounter")String makeup, HttpServletRequest request) {
		int index = pageservice.getCurrentIndex();
		Map<String,Object> closetmap = new HashMap<>();
		Map<String,Object> makeupmap = new HashMap<>();
		closetmap.put("index", index);
		makeupmap.put("index", index);
		index++;
		
		if(index>5) {
			index=1;
		}
		int closetcount, makeupcount;
		if(closet!="") {
			closetcount = Integer.parseInt(closet);
		}
		else {
			closetcount=0;
		}
		if(makeup!="") {
			makeupcount = Integer.parseInt(makeup);
		}
		else {
			makeupcount=0;
		}
		closetmap.put("viewindex", index);
		closetmap.put("closetcount", closetcount);
		makeupmap.put("viewindex", index);
		makeupmap.put("makeupcount", makeupcount);
		
		pageservice.ClosetCount(closetmap);
		pageservice.MakeupCount(makeupmap);
		
		ServletContext application = request.getServletContext();
		application.setAttribute("closet", null);
		application.setAttribute("makeup", null);
		
		return "success";
	}
	
	
}
