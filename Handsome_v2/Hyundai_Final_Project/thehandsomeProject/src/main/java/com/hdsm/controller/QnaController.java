package com.hdsm.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hdsm.domain.QnaDTO;
import com.hdsm.domain.ReviewAttachFileDTO;
import com.hdsm.service.MemberService;
import com.hdsm.service.ProductService;
import com.hdsm.service.QnaService;

@Controller
@RequestMapping("/qna/*")
public class QnaController {
	@Autowired
	QnaService qnaservice;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	ProductService productService;
	
	@PostMapping(value="/questioninsert", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<QnaDTO> insertQuestion(@RequestBody QnaDTO qna, HttpServletRequest request)throws Exception {
		qnaservice.insertQuestion(qna);
		return new ResponseEntity<>(qna, HttpStatus.OK);
	}
	
	@PostMapping(value="/questionmodify", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<QnaDTO> updateQuestion(@RequestBody QnaDTO qna)throws Exception{
		qnaservice.modifyQuestion(qna);
		return new ResponseEntity<>(qna, HttpStatus.OK);
	}
	@PostMapping(value="/questiondelete", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<QnaDTO> deleteQuestion(@RequestBody QnaDTO qna) {
		System.out.println(qna);
		long qno = qna.getQno();
		System.out.println(qno);
		qnaservice.deleteQna(qno);
		return new ResponseEntity<>(qna, HttpStatus.OK);
	}
	@PostMapping(value="/questionreadformodify", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<QnaDTO> ReadForModify(@RequestBody QnaDTO qna, Model model) {
		long qno = qna.getQno();
		QnaDTO qnadto = qnaservice.readQnAByQno(qno);
		return new ResponseEntity<>(qnadto, HttpStatus.OK);
	}
}
