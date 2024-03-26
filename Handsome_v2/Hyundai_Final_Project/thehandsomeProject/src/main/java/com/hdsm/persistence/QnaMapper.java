package com.hdsm.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hdsm.domain.QnaDTO;




public interface QnaMapper {
	//질문 리스트 가져오기
	public List<QnaDTO> getQnaList(@Param("pid") String pid);
	//질문 작성
	public void insert(QnaDTO qna);
	//질문 내용 가져오는 거
	public QnaDTO read(long qno);
	
	public boolean update(QnaDTO qna);
	
	public boolean delete(long qno);
	
	public int getQnaCount(@Param("pid") String pid);
	//비밀글 여부
	public void setSecret(long qno);
	
	public QnaDTO readqno(long qno);
}
