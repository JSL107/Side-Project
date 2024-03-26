/*
 * package com.hyundai.handsome.mapper;
 * 
 * import org.junit.Test;
 * import org.junit.runner.RunWith;
 * import org.springframework.beans.factory.annotation.Autowired;
 * import org.springframework.test.context.ContextConfiguration;
 * import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
 * 
 * @RunWith(SpringJUnit4ClassRunner.class)
 * 
 * @ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
 * public class EventMapperTests {
 * 
 * @Autowired
 * private EventMapper eventmapper;
 * 
 * 이벤트 등록 테스트
 * 
 * // @Test
 * // public void addCoupon() throws Exception {
 * // EventVO event = new EventVO();
 * //
 * // event.setEid(0);
 * // event.setEname("test");
 * // event.setEdetail("test");
 * // event.setEstartdate(new Date());
 * // event.setEenddate(new Date());
 * // event.setEimage(
 * //
 * "http://cdn.thehandsome.com/pc/event/list/banner/20221014_52319086191959224_ko.jpg"
 * );
 * // event.setEamount(10);
 * // event.setElimit(10000);
 * // System.out.println("Before BookVO :" + event);
 * //
 * // eventmapper.addEvent(event);
 * //
 * // System.out.println("After BookVO :" + event);
 * //
 * // }
 * 
 * 이벤트 목록 테스트
 * 
 * 
 * @Test
 * public void eventGetListTest() throws Exception {
 * 
 * Criteria cri = new Criteria(1, 10); // 3페이지 & 10개 행 표시
 * cri.setKeyword("test1");
 * 
 * List<EventVO> list = eventmapper.getEventList(cri);
 * 
 * for (int i = 0; i < list.size(); i++) {
 * System.out.println("list" + i + ".........." + list.get(i));
 * }
 * 
 * }
 * 
 * 
 * 이벤트 총 수
 * 
 * @Test
 * public void eventGetTotalTest() throws Exception {
 * Criteria cri = new Criteria();
 * cri.setKeyword("test");
 * 
 * int total = eventmapper.eventGetTotal(cri);
 * System.out.println("total..." + total);
 * }
 * 
 * 
 * 이벤트 상세 페이지
 * //
 * // @Test
 * // public void getEventDetailTest() {
 * //
 * // int eid = 1;
 * //
 * // EventVO event = eventmapper.getEventDetail(eid);
 * //
 * // System.out.println("event......." + event);
 * //
 * // }
 * 
 * 이벤트 정보 수정
 * // @Test
 * // public void eventModifyTest() {
 * //
 * // EventVO event = new EventVO();
 * //
 * // event.setEid(12);
 * // System.out.println("수정 전...................." +
 * eventmapper.getEventDetail(event.getEid()));
 * //
 * // event.setEname("수정");
 * // event.setEdetail("소개 수정 하였습니다.");
 * //
 * // eventmapper.eventModify(event);
 * // System.out.println("수정 후...................." +
 * eventmapper.getEventDetail(event.getEid()));
 * //
 * // }
 * 
 * 
 * @Test
 * public void eventDeleteTest() {
 * 
 * 
 * int eid = 12;
 * 
 * int result = eventmapper.eventDelete(eid);
 * 
 * if(result == 1) {
 * System.out.println("삭제 성공");
 * }
 * 
 * }
 * 
 * 이미지 등록
 * // @Test
 * // public void addImageTest() {
 * //
 * // ImageVO vo = new ImageVO();
 * //
 * // vo.setEid(1);
 * // vo.setFileName("test3");
 * // vo.setUploadPath("test3");
 * // vo.setUuid("test3");
 * //
 * // eventmapper.addImage(vo);
 * //
 * // }
 * 
 * 이벤트 총 수
 * 
 * @Test
 * public void eventGetTotalTest() throws Exception {
 * Criteria cri = new Criteria();
 * cri.setKeyword("test");
 * 
 * int total = eventmapper.eventGetTotal(cri);
 * System.out.println("total..." + total);
 * }
 * 
 * 
 * 이벤트 상세 페이지
 * 
 * @Test
 * public void getEventDetailTest() {
 * 
 * int eid = 1;
 * 
 * EventVO event = eventmapper.getEventDetail(eid);
 * 
 * System.out.println("event......." + event);
 * 
 * }
 * 
 * 
 * 이벤트 정보 수정
 * // @Test
 * // public void eventModifyTest() {
 * //
 * // EventVO event = new EventVO();
 * //
 * // event.setEid(12);
 * // System.out.println("수정 전...................." +
 * eventmapper.getEventDetail(event.getEid()));
 * //
 * // event.setEname("수정");
 * // event.setEdetail("소개 수정 하였습니다.");
 * //
 * // eventmapper.eventModify(event);
 * // System.out.println("수정 후...................." +
 * eventmapper.getEventDetail(event.getEid()));
 * //
 * // }
 * 
 * 정보 삭제
 * 
 * @Test
 * public void eventDeleteTest() {
 * 
 * int eid = 12;
 * 
 * int result = eventmapper.eventDelete(eid);
 * 
 * if(result == 1) {
 * System.out.println("삭제 성공");
 * }
 * 
 * }
 * 
 * }
 */