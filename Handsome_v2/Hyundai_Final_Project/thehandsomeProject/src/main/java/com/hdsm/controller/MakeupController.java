package com.hdsm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hdsm.domain.PersonalColorVO;
import com.hdsm.domain.ProductVO;
import com.hdsm.service.MakeupService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/makeup/*")
@AllArgsConstructor
public class MakeupController {

    @Autowired
    private MakeupService service;

    @GetMapping("/main")
    public String mainForm() {
        log.info("화장 메인페이지로 넘어갑니다.");
        return "makeup/main";
    }

    @GetMapping("/shot")
    public String shotForm() {
        log.info("화장 메인페이지로 넘어갑니다.");
        return "makeup/shot";
    }

    @PostMapping("/artist")
    public String makeupForm(@RequestParam("personalColor") String personalColor,
                             @RequestParam("fileName") String fileName,
                             Model model) {
        log.info("화장해봅시다.");
        log.info("당신의 퍼스널 컬러는 " + personalColor);
        log.info("이미지 파일의 위치는 " + fileName);

        List<PersonalColorVO> colorList = service.getSeasonalColor(personalColor);

        for (PersonalColorVO color : colorList) {
            String substr = color.getRgb().replace("rgb(", "");
            substr = substr.replace(")", "");
            String rgbstr[] = new String[3];
            rgbstr = substr.split(", ");
            int r = Integer.parseInt(rgbstr[0]);
            int g = Integer.parseInt(rgbstr[1]);
            int b = Integer.parseInt(rgbstr[2]);

            color.setRgb(String.format("#%02x%02x%02x", r, g, b));
        }

        model.addAttribute("colorList", colorList);
        model.addAttribute("personalColor", personalColor);
        model.addAttribute("fileName", fileName);
        return "makeup/makeup2";
    }

    @PostMapping("/recommends")
    public String recommendProducts(@RequestParam("face") String faceColor,
                                    @RequestParam("eye") String eyeColor,
                                    @RequestParam("lip") String lipColor,
                                    Model model) {
        log.info("상품 추천 페이지입니다.");

        List<ProductVO> faceList = null;
        List<ProductVO> eyeList = null;
        List<ProductVO> lipList = null;

        if (!faceColor.equals("None")) {
            faceList = service.getCosmetics(faceColor);
        }
        if (!eyeColor.equals("None")) {
            eyeList = service.getCosmetics(eyeColor);
        }
        if (!lipColor.equals("None")) {
            lipList = service.getCosmetics(lipColor);
        }

        model.addAttribute("faceList", faceList);
        model.addAttribute("eyeList", eyeList);
        model.addAttribute("lipList", lipList);
        return "makeup/recommends";
    }

//TODO :: 1. shot.jsp로 부터 봄 웜톤, 여름 쿨톤, 가을 웜톤, 겨울 쿨톤 4개중 결과가 나와서 airesult페이지에 뿌려주어야함
    @PostMapping("/result")
   public String result(@RequestParam("personalColor") String personalColor, 
		   				@RequestParam("fileName") String fileName,
		   				Model model) {
		/* public void result( Model model) { */
        //TODO :: 2. 1번의 결과를 model에 담아 뿌려주어야함
    	log.info(personalColor);
        model.addAttribute("personalColor", personalColor);
        model.addAttribute("fileName", fileName);
        return "makeup/airesult";
    }
}
