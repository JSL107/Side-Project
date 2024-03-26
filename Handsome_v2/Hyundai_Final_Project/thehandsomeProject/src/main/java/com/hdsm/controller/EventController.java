package com.hdsm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hdsm.service.EventService;

import lombok.extern.log4j.Log4j;


@Controller
@RequestMapping("/event")
@Log4j
public class EventController {

    @Autowired
    private EventService eventService;

    @GetMapping("/eventlist")
    public void eventList(Model model) throws Exception {
        model.addAttribute("eid", eventService.getEventList());
    }

    @GetMapping("/eventdetails")
    public void eventDetails(@RequestParam("eid") Integer eid, Model model) throws Exception {
        model.addAttribute("eid", eventService.getEventDetail(eid).getEid());
        model.addAttribute("ename", eventService.getEventDetail(eid).getEname());
        model.addAttribute("estartdate", eventService.getEventDetail(eid).getEstartdate());
        model.addAttribute("eenddate", eventService.getEventDetail(eid).getEenddate());
        model.addAttribute("eimage", eventService.getEventDetail(eid).getEimage());
        model.addAttribute("edetail", eventService.getEventDetail(eid).getEdetail());
    }

    @GetMapping("/maineventdetail")
    public void mainEventDetails(@RequestParam("eid") Integer eid, @RequestParam("ename") String ename, Model model) throws Exception {
        model.addAttribute("eid", eventService.getEventDetail(eid).getEid());
        model.addAttribute("ename", ename);
        model.addAttribute("estartdate", eventService.getEventDetail(eid).getEstartdate());
        model.addAttribute("eenddate", eventService.getEventDetail(eid).getEenddate());
        model.addAttribute("eimage", eventService.getEventDetail(eid).getEimage());
        model.addAttribute("edetail", eventService.getEventDetail(eid).getEdetail());
    }


}
