package com.hdsm.service;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hdsm.domain.QnaDTO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class QnaServiceTests {
	@Autowired
	private QnaService service;
	
	@Test
	public void inserttest() {
		QnaDTO qna = new QnaDTO();
//		qna.setMid("1");
		qna.setPid("1");
		qna.setQcontent("테스트");
		service.insertQuestion(qna);
	}
	@Test
	public void getList() {
		service.getQnaList("1").forEach(board -> log.info(board));
	}
	
	@Test
	public void update() {
		QnaDTO qna = new QnaDTO();
		qna.setQno(6);
		qna.setQcontent("수정이요");
		service.modifyQuestion(qna);
	}
	
	@Test
	public void delete() {
		long qno = 7;
		service.deleteQna(qno);
	}

	@Test
	public void getcount() {
		String pid = "1";
		log.info(service.getQnaCount(pid));
		int result = service.getQnaCount(pid);
		log.info(result);
	}
	
	@Test
	public void setSecret() {
		long qno=6;
		service.setSecret(qno);
	}
}
