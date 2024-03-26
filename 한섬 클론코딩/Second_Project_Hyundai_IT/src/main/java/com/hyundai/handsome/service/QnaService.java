package com.hyundai.handsome.service;

import com.hyundai.handsome.vo.QnaVO;
import com.hyundai.handsome.vo.Criteria;

import java.util.List;

//작성자 : 김가희 , 김나형

public interface QnaService {

    /* Qna 글 작성 */
    public void qnaAdd(QnaVO qna) throws Exception;

    /* Qna 상세 페이지 */
    public QnaVO getQnaDetail(Integer eid) throws Exception;

    /* Qna 글 작성 */
    public List<QnaVO> getQnaList(Criteria cri) throws Exception;

    /* Qna 총 수 */
    public int qnaGetTotal() throws Exception;

    /* Qna 수정 */
    public int qnaModify(QnaVO qna) throws Exception;

    /* Qna 정보 삭제 */
    public int qnaDelete(int qid);
    
    /* Qna 답글 달기 (관리자용)*/
    public void qnaReplyAdd(int qid,String reply);

}
