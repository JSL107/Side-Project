package com.hdsm.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hdsm.domain.QnaDTO;
import com.hdsm.persistence.QnaMapper;

@Service
public class QnaServiceImpl implements QnaService{
	
	@Autowired
	private QnaMapper qnamapper;
	
	@Override
	public List<QnaDTO> getQnaList(@Param("pid") String pid) {
		return qnamapper.getQnaList(pid);
	}

	@Override
	public void insertQuestion(QnaDTO qna) {
		qnamapper.insert(qna);
		
	}

	@Override
	public QnaDTO readQuestionContent(long qno) {
	
		return qnamapper.read(qno);
	}

	@Override
	public boolean modifyQuestion(QnaDTO qna) {
		
		return qnamapper.update(qna)==true;
	}

	@Override
	public boolean deleteQna(long qno) {
		
		return qnamapper.delete(qno)==true;
	}

	@Override
	public int getQnaCount(@Param("pid") String pid) {
	
		return qnamapper.getQnaCount(pid);
	}

	@Override
	public void setSecret(long qno) {
		 qnamapper.setSecret(qno);
		
	}
	
	@Override
	public QnaDTO readQnAByQno(long qno) {
		return qnamapper.readqno(qno);
	}
}
