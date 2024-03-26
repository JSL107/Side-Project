package com.hyundai.handsome.service;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hyundai.handsome.vo.CartVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MyCartTest {
    
    @Autowired
    CartService service;
    
    //장바구니 추가 테스트
    @Test
    public void cartAddTest() {
        String mid = "nadong";
        
        CartVO cart = new CartVO();
        cart.setCid(122);
        cart.setMid("nadong");
        cart.setPid("CN2C7WJC100W");
        cart.setPsize("S");
        cart.setPcolor("CN2C7WJC100W_BK");
        cart.setPamount(1);
        
        service.cartAdd(mid, cart);        
    }
    
    // 장바구니번호로 상세내역 조회하는 메소드 테스트
    @Test
    public void cartSelectTest() {
        int cid = 122;
        service.cartSelect(cid);
    }

    // 장바구니 수량 업데이트 테스트
    @Test
    public void cartUpdateTest() {
        int cid = 122;
        int qty = 5;
        service.cartUpdate(cid, qty);
    }
    // 장바구니 옵션 업데이트 테스트
    @Test
    public void updateOptionTest() {
        int cid = 122;
        String colorcode = "CN2C7WJC100W_BK";
        String size = "M";
        service.updateOption(cid, colorcode, size);
    }
    // 장바구니 갯수 테스트
    @Test
    public void cartCntTest() {
        String mid = "nadong";
        service.cartCnt(mid);
    }
}
