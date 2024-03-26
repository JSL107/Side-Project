package com.hdsm.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hdsm.domain.QnaDTO;

public interface QnaService {
	
	public List<QnaDTO> getQnaList(@Param("pid") String pid);
	
	public void insertQuestion(QnaDTO qna);
	
	public QnaDTO readQuestionContent(long qno);
	
	public boolean modifyQuestion(QnaDTO qna);
	
	public boolean deleteQna(long qno);
	
	public int getQnaCount(@Param("pid") String pid);
	
	public void setSecret(long qno);
	
	public QnaDTO readQnAByQno(long qno);
}
