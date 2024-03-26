package com.hdsm.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hdsm.service.PageCounterService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/closet/*")
@AllArgsConstructor
public class ClosetController {
	
	@Autowired
	PageCounterService service;
	
    @GetMapping("/closet2")
    public String closet2() {
        return "closet/closet2" ;
    }

    @PostMapping("/closet_result")
    public String result() {
        return "closet/closet_result" ;
    }


    @GetMapping("/closet")
    public String closet() {
        return "closet/closet" ;
    }



    @GetMapping("/closetwebcam2")
    public String closetwebcam2() {
        return "closet/closetwebcam2" ;
    }


}
