package com.hyundai.handsome.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

/*
 * 작성자 : 김가희, 김나형
 * 
 * 상품 컨트롤러 JUnit 테스트
 */
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
        "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
        "file:src/main/webapp/WEB-INF/spring/security-context.xml" })
@Log4j
public class ProductControllerTests {

    @Autowired
    private WebApplicationContext ctx;

    private MockMvc mockMvc;

    @Before
    public void setup() {
        this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
    }// end setup

    // 상품 상세 정보 테스트
    @Test
    public void testProductGetDetail() throws Exception {
        log.info(
                mockMvc.perform(
                        MockMvcRequestBuilders.get("/product/productDetail")
                                .param("pid", "SJ2C8WPC515W")
                                .param("ccolorcode", "SJ2C8WPC515W_BK"))
                        .andReturn()
                    );

    }// end testProductGetDetail

    // 상품 색상 정보 테스트
    @Test
    public void testProductGetColor() throws Exception {
        log.info(mockMvc.perform(MockMvcRequestBuilders.get("/product/productColor")
                .param("pid", "SJ2C8WPC515W"))
                .andReturn());
    }//end testProductGetColor
    
    // 상품 사이즈 정보 테스트
    @Test
    public void testProductGetStock() throws Exception {
        log.info(mockMvc.perform(MockMvcRequestBuilders.get("/product/productStock")
                .param("pid", "SJ2C8WPC515W")
                .param("ccolorcode", "SJ2C8WPC515W_BK"))
                .andReturn());
    }//end testProductGetStock

}// end class
