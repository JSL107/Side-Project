package com.hyundai.handsome.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hyundai.handsome.vo.EventVO;
import com.hyundai.handsome.vo.ImageVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class eventServiveTests {

    @Autowired
    private EventService eventservice;

//	@Test
//	public void eventServiveTests() throws Exception {
//		EventVO event = new EventVO();
//		event.setEid(2);
//		event.setEname("test1");
//		event.setEdetail("test1");
//        event.setEstartdate(new Date());
//        event.setEenddate(new Date());
//        event.setEimage("http://cdn.thehandsome.com/pc/event/list/banner/20220428_37693141380296097_ko.jpg");
//        event.setEamount(10);
//        event.setElimit(10000);
//		eventservice.addEvent(event);
//	}

    /* 상품 등록 & 상품 이미지 등록 테스트 */
    @Test
    public void addImageTests() throws Exception {
        EventVO event = new EventVO();
        // 상품 정보
        event.setEname("test3");
        event.setEdetail("test3");
        event.setEstartdate(new Date());
        event.setEenddate(new Date());
        event.setEimage("test3");
        event.setEamount(10);
        event.setElimit(100);


        // addEvent() 메서드 호출
        eventservice.addEvent(event);

        System.out.println("등록된 VO : " + event);
    }

}
