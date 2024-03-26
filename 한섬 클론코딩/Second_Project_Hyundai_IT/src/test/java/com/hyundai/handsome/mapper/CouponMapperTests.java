package com.hyundai.handsome.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
        "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
        "file:src/main/webapp/WEB-INF/spring/security-context.xml" })
@Log4j
public class CouponMapperTests {
    
    @Autowired
    private CouponMapper mapper;
    
    @Test   
    public void eventCouponTest() {
        String ccode = "abc";
        
        
    }
    
    @Test
    public void addCouponTest() {
        
    }
    
    @Test
    public void getCouponCountTest() {
        
    }
    
    @Test
    public void getCouponTest() {
        
    }
    
    @Test
    public void getCouponListTest() {
        
    }
    
    @Test
    public void getCouponEidTest() {
        
    }
}