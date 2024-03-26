package com.hyundai.handsome.service;

import com.hyundai.handsome.vo.EventVO;
import com.hyundai.handsome.vo.Criteria;

import java.util.List;

//작성자 : 김찬중, 이준석

public interface EventService {
    //    이벤트 페이지에서 이벤트 리스트 출력
    public List<EventVO> getEventList() throws Exception;

//    관리자 페이지에서 이벤트 등록
    public void addEvent(EventVO event) throws Exception;

//    이벤트 상세 페이지
    public EventVO getEventDetail(Integer eid) throws Exception;

    public List<EventVO> getEventList(Criteria cri) throws Exception;

    /* 이벤트 총 수 */
    public int eventGetTotal(Criteria cri) throws Exception;

    /* 이벤트 수정 */
    public int eventModify(EventVO event) throws Exception;

    /* 이벤트 정보 삭제 */
    public int eventDelete(int eid);

//    이미지 올리는 메소드
    public void addImage(EventVO event) throws Exception;

}
