package com.hyundai.handsome.service;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.hyundai.handsome.mapper.CartMapperTest;
import com.hyundai.handsome.vo.Criteria;
import com.hyundai.handsome.vo.ProductColorVO;
import com.hyundai.handsome.vo.ProductStockVO;
import com.hyundai.handsome.vo.ProductVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
        "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
        "file:src/main/webapp/WEB-INF/spring/security-context.xml" })
@Log4j

public class ProductServiceTest {

    @Autowired
    private ProductService service;
    
    // 상품 상세 정보 테스트
    @Test
    public void productGetDetailTest() {
        String pid = "O22CAWJC381W";
        String colorcode = "O22CAWJC381W_IV";
        ProductVO result = service.productGetDetail(pid, colorcode);
        log.info("상품 상세 정보 Test : " + result);
    }
    
    // 상품 컬러 리스트 테스트
    @Test
    public void productGetColorTest() {
        String pid = "O22CAWJC381W";
        List<ProductColorVO> result = service.productGetColor(pid);
        for(ProductColorVO vo : result) {
            log.info("상품 컬러 데이터 : " + vo);
        }
    }
    
    // 상품 재고 리스트 테스트
    @Test
    public void productGetStockTest() {
        String pid = "O22CAWJC381W";
        String colorcode = "O22CAWJC381W_IV";
        List<ProductStockVO> result = service.productGetStock(pid, colorcode);
        for(ProductStockVO vo : result) {
            log.info("상품 사이즈 데이터 : " + vo);
        }
    }

    // 페이징 시 필요한 총 상품 개수 테스트
    @Test
    public void getTotalTest() {
        int result = service.getTotal("여성", "아우터", "재킷");
        log.info("페이징 시 필요한 총 상품 개수 : " + result);
    }
    
    // 브랜드별 총 상품개수
    @Test
    public void getTotalBrandTest() {
        String bname = "BALLY";
        int result = service.getTotalBrand(bname);
        log.info("브랜드별 총 상품 개수 : " + result);
    }
}
