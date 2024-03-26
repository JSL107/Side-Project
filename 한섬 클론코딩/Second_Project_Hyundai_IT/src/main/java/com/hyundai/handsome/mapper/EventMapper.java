package com.hyundai.handsome.mapper;

import java.util.List;

import com.hyundai.handsome.vo.Criteria;
import com.hyundai.handsome.vo.EventVO;
import com.hyundai.handsome.vo.ImageVO;

/**
 * CouponMapper
 *
 * @author 이준석
 * @since 10.06
 *
 * <pre>
 * 수정일                 수정자                         수정내용
 * ----------  ---------------    ---------------------------
 * 2022.10.06    이준석                        최초 생성
 * 2022.10.15	 이준석						  메소드 구현
 *        </pre>
 */

public interface EventMapper {

//    이벤트의 리스트를 가져오는 메소드
    public List<EventVO> getEventList();

//    페이징 처리(Criteria)를 통한 이벤트 리스트를 가져오는 메소드
    public List<EventVO> getEventList(Criteria cri);

//    이벤트의 상세정보를 이벤트 번호(eid)를 통해 가져오는 메소드
    public EventVO getEventDetail(Integer eid);

//    관리자 페이지에서 이벤트 객체(EventVO)를 통해 이벤트 등록을 해주는 메소드
    public void addEvent(EventVO event) throws Exception;

//    관리자 페이지에서 이벤트 페이지를 관리하고 페이징 처리(Criteria)를 통해 출력하는 메소드
    public int eventGetTotal(Criteria cri);

    /* 이벤트 정보 수정 */
    public int eventModify(EventVO event);

    /* 이벤트 정보 삭제 */
    public int eventDelete(int eid);

    /* 이미지 등록 */
    public void addImage(ImageVO vo);

}
