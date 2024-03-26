package com.hyundai.handsome.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hyundai.handsome.service.ChartService;
import com.hyundai.handsome.service.EventService;
import com.hyundai.handsome.vo.ChartVO;
import com.hyundai.handsome.vo.Criteria;
import com.hyundai.handsome.vo.EventVO;
import com.hyundai.handsome.vo.ImageVO;
import com.hyundai.handsome.vo.PageDTO;

import lombok.AllArgsConstructor;

/**
 * AdminController
 *
 * @author 김찬중
 * @since 10.13
 *
 * <pre>
 * 수정일                 수정자                          수정내용
 * ----------  ---------------      ---------------------------
 * 2022.10.13    김찬중                          최초 생성
 *        </pre>
 */

@Controller
@RequestMapping("/admin")
@AllArgsConstructor
public class AdminController {

    @Autowired
    private EventService eventService;
    @Autowired
    private ChartService chartService;

    /* 관리자 메인 페이지 이동 */
    @RequestMapping(value = "main", method = RequestMethod.GET)
    public void adminMainGET() throws Exception {

    }

    /* 상품 등록 페이지 접속 */
    @RequestMapping(value = "productAdd", method = RequestMethod.GET)
    public void productAddGET() throws Exception {

    }

    /* 이벤트 등록 페이지 접속 */
    @RequestMapping(value = "eventAdd", method = RequestMethod.GET)
    public void eventAddGET() throws Exception {

    }

    /* 상품 등록 페이지 접속 */
    @RequestMapping(value = "chart", method = RequestMethod.GET)
    public void chartGET() throws Exception {

    }

    /* 이벤트 등록 페이지 접속 */
    @RequestMapping(value = "eventAdd", method = RequestMethod.POST)
    public String eventAddPOST(EventVO event, RedirectAttributes rttr) throws Exception {

        eventService.addEvent(event); // 이벤트 등록 쿼리 수행

        rttr.addFlashAttribute("enroll_result", event.getEname());

        return "redirect:/admin/eventManage";
    }

    /* 이벤트 관리 페이지 접속 */
    @RequestMapping(value = "eventManage", method = RequestMethod.GET)
    public void eventManageGET(Criteria cri, Model model) throws Exception {

        /* 이벤트 목록 출력 데이터 */
        List list = eventService.getEventList(cri);

        if (!list.isEmpty()) {
            model.addAttribute("list", list); // 이벤트 존재 경우
        } else {
            model.addAttribute("listCheck", "empty"); // 이벤트 존재하지 않을 경우
        }

        /* 페이지 이동 인터페이스 데이터 */
        int total = eventService.eventGetTotal(cri);

        PageDTO pageMaker = new PageDTO(cri, total);

        model.addAttribute("pageMaker", pageMaker);
    }

    /* 이벤트 상세 페이지 */
    @GetMapping({"/eventDetail", "/eventModify"})
    public void eventGetInfoGET(int eid, Criteria cri, Model model) throws Exception {

        /* 이벤트 관리 페이지 정보 */
        model.addAttribute("cri", cri);

        /* 선택 이벤트 정보 */
        model.addAttribute("event", eventService.getEventDetail(eid));

    }

    /* 이벤트 수정 */
    @PostMapping("/eventModify")
    public String eventModifyPOST(EventVO event, RedirectAttributes rttr) throws Exception {

        int result = eventService.eventModify(event);

        rttr.addFlashAttribute("modify_result", result);

        return "redirect:/admin/eventManage";

    }

    /* 이벤트 정보 삭제 */
    @PostMapping("/eventDelete")
    public String eventDeletePOST(int eid, RedirectAttributes rttr) {

        eventService.eventDelete(eid);

        return "redirect:/admin/eventManage";

    }

    /* 첨부 파일 업로드 */
    @PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public ResponseEntity<List<ImageVO>> uploadAjaxActionPOST(MultipartFile[] eimage) {

        /* 이미지 파일 체크 */
        for (MultipartFile multipartFile : eimage) {

            File checkfile = new File(multipartFile.getOriginalFilename());
            String type = null;

            try {
                type = Files.probeContentType(checkfile.toPath());
            } catch (IOException e) {
                e.printStackTrace();
            }

            if (!type.startsWith("image")) {

                List<ImageVO> list = null;
                return new ResponseEntity<>(list, HttpStatus.BAD_REQUEST);

            }

        }
        // for
        // 나형이꺼
        // String uploadFolder =
        // "C:\\Users\\kosa\\git\\Second_Project_Hyundai_IT\\Second_Project_Hyundai_IT\\src\\main\\webapp\\resources\\upload";
        String uploadFolder = "C:\\Users\\chanjung\\git\\Second_Project_Hyundai_IT\\Second_Project_Hyundai_IT\\src\\main\\webapp\\resources\\upload";
        String datePath = "";

        /* 폴더 생성 */
        File uploadPath = new File(uploadFolder, datePath);

        if (uploadPath.exists() == false) {
            uploadPath.mkdirs();
        }
        /* 이미저 정보 담는 객체 */
        List<ImageVO> list = new ArrayList();
        for (MultipartFile multipartFile : eimage) {
            ImageVO imagevo = new ImageVO();
            /* 파일 이름 */
            String uploadFileName = multipartFile.getOriginalFilename();
            imagevo.setFileName(uploadFileName);
            imagevo.setUploadPath(datePath);

            /* uuid 적용 파일 이름 */
            String uuid = UUID.randomUUID().toString();
            imagevo.setUuid(uuid);

            /* 파일 위치, 파일 이름을 합친 File 객체 */
            File saveFile = new File(uploadPath, uploadFileName);

            /* 파일 저장 */
            try {
                multipartFile.transferTo(saveFile);
            } catch (Exception e) {
                e.printStackTrace();
            }
            list.add(imagevo);
        }
        ResponseEntity<List<ImageVO>> result = new ResponseEntity<List<ImageVO>>(list, HttpStatus.OK);
        return result;
    }

    /*만들어진 폴더에 넣은 이미지를 가져와서 보여주기*/
    @GetMapping("/display")
    public ResponseEntity<byte[]> getImage(String fileName) {
        File file = new File("C:\\Users\\chanjung\\git\\Second_Project_Hyundai_IT\\Second_Project_Hyundai_IT\\src\\main\\webapp\\resources\\upload\\" + fileName);
        ResponseEntity<byte[]> result = null;

        try {

            HttpHeaders header = new HttpHeaders();

            header.add("Content-type", Files.probeContentType(file.toPath()));

            result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);

        } catch (IOException e) {
            e.printStackTrace();
        }

        return result;

    }

    /* 이미지 파일 삭제 */
    @PostMapping("/deleteFile")
    public ResponseEntity<String> deleteFile(String fileName) {
        File file = null;

        try {
            /* 썸네일 파일 삭제 */
            file = new File("c:\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));

            file.delete();

            /* 원본 파일 삭제 */
            String originFileName = file.getAbsolutePath().replace("s_", "");

            file = new File(originFileName);

            file.delete();

        } catch (Exception e) {

            e.printStackTrace();

            return new ResponseEntity<String>("fail", HttpStatus.NOT_IMPLEMENTED);

        }
        return new ResponseEntity<String>("success", HttpStatus.OK);

    }

    /* 성별 및 잡화에대한 상품비율, 브랜드비율을 나타내는 차트 띄우기 */
    @RequestMapping(value = "/chart", method = RequestMethod.POST)
    public void chartPost(ChartVO chart) throws Exception {
    }

}