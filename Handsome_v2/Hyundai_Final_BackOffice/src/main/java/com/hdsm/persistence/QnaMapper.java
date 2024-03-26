package com.hdsm.persistence;

import java.util.List;
import java.util.Map;

import com.hdsm.domain.qna.QnaDTO;

public interface QnaMapper {
	//질문 리스트 가져오기
	public List<QnaDTO> qnaList();
	
	public void Reply();
	
	public QnaDTO qnaRead(int qno);
	
	public void reply(QnaDTO qnadto);
	
	public List<Map<String, Object>> qnaStatus();
}
