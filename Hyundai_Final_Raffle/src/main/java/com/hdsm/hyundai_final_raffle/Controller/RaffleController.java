package com.hdsm.hyundai_final_raffle.Controller;

import com.hdsm.hyundai_final_raffle.DTO.MemberDTO;
import com.hdsm.hyundai_final_raffle.DTO.RaffleDTO;
import com.hdsm.hyundai_final_raffle.mapper.RaffleMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.util.List;

@Controller
@Slf4j
public class RaffleController {

    @Autowired
    RaffleMapper mapper;

    @GetMapping("/raffle")
    public void raffle(@RequestParam("mid") String mid, Model model, HttpSession session, HttpServletRequest request) {
        List<RaffleDTO> raffleList = mapper.getRaffle();
        MemberDTO member = mapper.getMemberInfo(mid);
        model.addAttribute("mname", member.getMname());
        model.addAttribute("raffleList", raffleList);
        model.addAttribute("mid", mid);


    }

    @PostMapping("/raffle")
    @ResponseBody
    public String apply(@RequestParam("mid") String mid, @RequestParam("rid") String rid) {
        int isChecked = mapper.getDetails(mid, rid);
        if (isChecked == 0) {
            mapper.insertRaffleDetails(rid, mid, rid);
            mapper.updateParticipants(rid);
            return "success";
        } else {
            return "fail";
        }
    }

}
