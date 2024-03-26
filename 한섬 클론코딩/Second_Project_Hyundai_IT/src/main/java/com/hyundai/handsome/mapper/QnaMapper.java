package com.hyundai.handsome.mapper;

import java.util.List;

import com.hyundai.handsome.vo.Criteria;
import com.hyundai.handsome.vo.QnaVO;
import com.hyundai.handsome.vo.ImageVO;

//작성자: 김가희, 김나형
public interface QnaMapper {

//    QNA리스트를 페이징 처리(Criteria)된 리스트로 출력
    public List<QnaVO> getQnaList(Criteria cri) throws Exception;

//    QNA의 상세정보를 QNA번호(qid)를 통해 가져오는 메소드
    public QnaVO getQnaDetail(Integer qid) throws Exception;

//    관리자 페이지에서 QNA를 등록하는 메소드
    public void qnaAdd(QnaVO qna) throws Exception;

//    모든 QNA에 대해서 출력을 위한 메소드
    public int qnaGetTotal() throws Exception;

    /* 이벤트 정보 수정 */
    public int qnaModify(QnaVO qna) throws Exception;

    /* 이벤트 정보 삭제 */
    public int qnaDelete(int qid);

    /* Qna 답변 달기(관리자) */
    public void qnaReplyAdd(int qid,String reply);
    
    /* 이미지 등록 엑스엑스 */
    public void addImage(QnaVO qna);

}
