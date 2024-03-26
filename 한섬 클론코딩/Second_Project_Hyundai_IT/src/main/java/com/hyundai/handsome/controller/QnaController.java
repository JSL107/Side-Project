package com.hyundai.handsome.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hyundai.handsome.service.MemberService;
import com.hyundai.handsome.service.QnaService;
import com.hyundai.handsome.vo.Criteria;
import com.hyundai.handsome.vo.MemberVO;
import com.hyundai.handsome.vo.PageDTO;
import com.hyundai.handsome.vo.QnaVO;

import lombok.AllArgsConstructor;

//작성자 : 김가희 , 김나형

@Controller
@RequestMapping("/qna")
@AllArgsConstructor
public class QnaController {

    @Autowired
    private MemberService memberservice;
    @Autowired
    private QnaService QnaService;

    /* qna 입력 페이지 이동 */
    @GetMapping("/qnaAdd")
    public void QnaAddGET(Model model, Principal prin) throws Exception {
        // principal을 통해 mid 가져오기
        String mid = prin.getName();
        // MembeVO에 값 삽입
        MemberVO lvo = memberservice.memberLogin2(mid);
        model.addAttribute("member", memberservice.myPage(lvo.getMid()));
    }

    /* qna 등록 */
    @RequestMapping(value = "qnaAdd", method = RequestMethod.POST)
    public String QnaAddPOST(QnaVO Qna, RedirectAttributes rttr) throws Exception {
        QnaService.qnaAdd(Qna);
        rttr.addFlashAttribute("enroll_result", Qna.getQtitle());
        return "redirect:/qna/qnaMain";
    }

    /* qna 메인 페이지 이동 */
    @RequestMapping(value = "qnaMain", method = RequestMethod.GET)
    public void QnaMainGET(Criteria cri, Model model, Principal prin) throws Exception {

        // principal을 통해 mid 가져오기
        String mid = prin.getName();

        // MembeVO에 값 삽입
        MemberVO lvo = memberservice.memberLogin2(mid);
        model.addAttribute("member", memberservice.myPage(lvo.getMid()));

        // 페이징을 위한 전체 데이터 수 조회
        int total = QnaService.qnaGetTotal();

        model.addAttribute("pageMaker", new PageDTO(cri, total));
        model.addAttribute("totalQna", total);

        /* qna 목록 출력 데이터 */
        List list = QnaService.getQnaList(cri);

        if (!list.isEmpty()) {
            model.addAttribute("list", list); // qna 존재 경우
        } else {
            model.addAttribute("listCheck", "empty"); // qna 존재하지 않을 경우
        }

    }

    /* qna 상세 페이지 */
    @GetMapping("/qnaModify")
    public void QnaGetInfoGET(int qid, Model model, Principal prin) throws Exception {

        // principal을 통해 mid 가져오기
        String mid = prin.getName();
        // MembeVO에 값 삽입
        MemberVO lvo = memberservice.memberLogin2(mid);
        model.addAttribute("member", memberservice.myPage(lvo.getMid()));
        /* 선택 qna 정보 */
        model.addAttribute("qna", QnaService.getQnaDetail(qid));

    }

    /* qna 수정 */
    @PostMapping("/qnaModify")
    public String QnaModify(QnaVO qna) throws Exception {
        QnaService.qnaModify(qna);
        return "redirect:/qna/qnaMain";
    }

    /* qna 정보 삭제 */
    @GetMapping("/qnaDelete")
    public String QnaDeletePOST(int qid, RedirectAttributes rttr) {
        QnaService.qnaDelete(qid);
        return "redirect:/qna/qnaMain";

    }

    /* 관리자 qna 답변등록 */
    @PostMapping("/qnaReplyAdd")
    public String QnaReplyAddPOST(QnaVO qna, RedirectAttributes rttr) throws Exception {
        int qid = qna.getQid();
        String qreply = qna.getQreply();
        QnaService.qnaReplyAdd(qid, qreply);
        return "redirect:/qna/qnaMain";
    }

}