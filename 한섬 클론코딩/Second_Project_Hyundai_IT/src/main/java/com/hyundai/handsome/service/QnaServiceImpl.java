package com.hyundai.handsome.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hyundai.handsome.mapper.QnaMapper;
import com.hyundai.handsome.vo.Criteria;
import com.hyundai.handsome.vo.QnaVO;

import lombok.extern.log4j.Log4j;

//작성자 : 김가희 , 김나형

@Service
@Log4j
public class QnaServiceImpl implements QnaService {
    @Autowired
    QnaMapper qnaMapper;

    /* Qna 상세 페이지 */
    @Override
    public QnaVO getQnaDetail(Integer qid) throws Exception {
        log.info("getQnaDetail........" + qid);
        return qnaMapper.getQnaDetail(qid);
    }

    /* Qna 글 작성 */
    @Override
    public void qnaAdd(QnaVO Qna) throws Exception {
        qnaMapper.qnaAdd(Qna);
    }

    /* Qna 목록  */
    @Override
    public List<QnaVO> getQnaList(Criteria cri) throws Exception {
        log.info("(service)getQnaList()....." + cri);
        return qnaMapper.getQnaList(cri);
    }

    /* Qna 총 수 */
    @Override
    public int qnaGetTotal() throws Exception {
        log.info("(service)QnaGetTotal().......");
        return qnaMapper.qnaGetTotal();
    }

    /* Qna 수정 */
    @Override
    public int qnaModify(QnaVO Qna) throws Exception {
        log.info("(service) QnaModify........." + Qna);
        return qnaMapper.qnaModify(Qna);
    }

    /* Qna 정보 삭제 */
    @Override
    public int qnaDelete(int qid) {

        log.info("(service) QnaDelete........." + qid);

        return qnaMapper.qnaDelete(qid);
    }

    /* Qna 답변 달기(관리자) */
    @Override
    public void qnaReplyAdd(int qid,String reply) {
        log.info("(service) QnaReplyAdd.........." + qid);
        qnaMapper.qnaReplyAdd(qid,reply);
    }

}