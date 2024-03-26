package com.hdsm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hdsm.domain.datastatistics.ClosetDTO;
import com.hdsm.domain.datastatistics.EventDTO;
import com.hdsm.domain.datastatistics.MakeupDTO;
import com.hdsm.service.datastatistics.DatastatisticsService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/DataStatistics/*")
public class DatastatisticsController {
	
	@Autowired
	DatastatisticsService dataservice;
	
	@GetMapping("event")
	public String eventStatistitcsView(Model model) {
		ClosetDTO closet = dataservice.getClosetCount();
		MakeupDTO makeup = dataservice.getMakeupCount();
		
		model.addAttribute("closet", closet);
		model.addAttribute("makeup", makeup);
		model.addAttribute("event", dataservice.EventCount());
		
		return "DataStatistics/event";
	}
}
