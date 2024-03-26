package com.hyundai.handsome.mapper;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.hyundai.handsome.vo.CartVO;
import com.hyundai.handsome.vo.ProductVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
        "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
        "file:src/main/webapp/WEB-INF/spring/security-context.xml" })
@Log4j

public class CartMapperTest {
    
    @Autowired
    private CartMapper mapper;
    
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
        
        mapper.cartAdd(mid, cart);        
    }
    
    // 장바구니 동일 상품, 색상, 사이즈로 있는지 확인하는 메소드 테스트
    @Test
    public void cartOverlapTest() {
        String mid = "nadong";
        
        CartVO cart = new CartVO();
        cart.setCid(122);
        cart.setMid("nadong");
        cart.setPid("CN2C7WJC100W");
        cart.setPsize("S");
        cart.setPcolor("CN2C7WJC100W_BK");
        cart.setPamount(1);
        
        mapper.cartOverlap(mid, cart);        
    }
    
    // 장바구니에 동일한 상품이 있으면 수량을 합치는 메소드 테스트
    @Test
    public void cartOverlapUpdateTest() {
        int amount = 5;
        String pcolor = "CN2C7WJC100W_BK";
        String psize = "S";
        
        mapper.cartOverlapUpdate(amount, pcolor, psize);
    }
    
    // 장바구니번호로 상세내역 조회하는 메소드 테스트
    @Test
    public void cartSelectTest() {
        int cid = 122;
        mapper.cartSelect(cid);
    }
    // 장바구니 리스트 테스트
    @Test
    public void cartListTest() {
        String mid = "nadong";
        mapper.cartList(mid);
    }
    // 장바구니 삭제 테스트
    @Test
    public void cartDeleteTest() {
        List<Integer> cidList = new ArrayList<>();
        cidList.add(131);
        mapper.cartDelete(cidList);
    }
    // 장바구니 수량 업데이트 테스트
    @Test
    public void cartUpdateTest() {
        int cid = 122;
        int qty = 5;
        mapper.cartUpdate(cid, qty);
    }
    // 장바구니 옵션 업데이트 테스트
    @Test
    public void updateOptionTest() {
        int cid = 122;
        String colorcode = "CN2C7WJC100W_BK";
        String size = "M";
        mapper.updateOption(cid, colorcode, size);
    }
    // 장바구니 갯수 테스트
    @Test
    public void cartCntTest() {
        String mid = "nadong";
        mapper.cartCnt(mid);
    }



}
