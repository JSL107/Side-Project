package com.hdsm.service.qna;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hdsm.domain.qna.QnaDTO;
import com.hdsm.persistence.QnaMapper;

@Service
public class QnaServiceImpl implements QnaService{
	
	@Autowired
	private QnaMapper qnamapper;

	@Override
	public List<QnaDTO> getQnaList() {		
		return qnamapper.qnaList();
	}

	@Override
	public void replyQuestion(QnaDTO qna) {		
		qnamapper.reply(qna);		
	}
	
	@Override
	public QnaDTO getqnaRead(int qno) {		
		return qnamapper.qnaRead(qno);
	}

	@Override
	public List<Map<String, Object>> getQnaStatus() {
		return qnamapper.qnaStatus();
	}

}
