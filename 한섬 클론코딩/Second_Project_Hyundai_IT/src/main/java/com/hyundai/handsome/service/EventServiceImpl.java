package com.hyundai.handsome.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hyundai.handsome.mapper.EventMapper;
import com.hyundai.handsome.vo.Criteria;
import com.hyundai.handsome.vo.EventVO;

import lombok.extern.log4j.Log4j;

//작성자 : 김찬중, 이준석

@Service
public class EventServiceImpl implements EventService {
    @Autowired
    EventMapper eventMapper;

    //    이벤트 페이지에서 이벤트 리스트 출력
    @Override
    public List<EventVO> getEventList() throws Exception {
        return eventMapper.getEventList();
    }

    /* 이벤트 상세 페이지 */
    @Override
    public EventVO getEventDetail(Integer eid) throws Exception {
        return eventMapper.getEventDetail(eid);
    }

    //    관리자 페이지에서 이벤트 등록
    @Override
    public void addEvent(EventVO event) throws Exception {
        eventMapper.addEvent(event);
    }

    //    페이징 처리까지 되는 이벤트 리스트
    @Override
    public List<EventVO> getEventList(Criteria cri) throws Exception {
        return eventMapper.getEventList();
    }

    /* 이벤트 총 수 */
    @Override
    public int eventGetTotal(Criteria cri) throws Exception {
        return eventMapper.eventGetTotal(cri);
    }

    /* 이벤트 수정 */
    @Override
    public int eventModify(EventVO event) throws Exception {
        return eventMapper.eventModify(event);
    }

    /* 이벤트 정보 삭제 */
    @Override
    public int eventDelete(int eid) {
        return eventMapper.eventDelete(eid);
    }

    //    이미지 올리는 메소드
    @Override
    public void addImage(EventVO event) throws Exception {
        eventMapper.addEvent(event);


    }

}