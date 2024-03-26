package com.hdsm.service.qna;

import java.util.List;
import java.util.Map;

import com.hdsm.domain.qna.QnaDTO;

public interface QnaService {
	
	public List<QnaDTO> getQnaList();
	
	public void replyQuestion(QnaDTO qna);
	
	public QnaDTO getqnaRead(int qno);
	
	public List<Map<String, Object>> getQnaStatus();
}
