package com.hyundai.handsome.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.hyundai.handsome.vo.Criteria;
import com.hyundai.handsome.vo.ProductColorVO;
import com.hyundai.handsome.vo.ProductStockVO;
import com.hyundai.handsome.vo.ProductVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
        "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
        "file:src/main/webapp/WEB-INF/spring/security-context.xml" })
@Log4j

public class ProductMapperTests {

    @Autowired
    private ProductMapper mapper;
    
    // 상품 상세 정보 테스트
    @Test
    public void productGetDetailTest() {
        String pid = "O22CAWJC381W";
        String colorcode = "O22CAWJC381W_IV";
        ProductVO result = mapper.productGetDetail(pid, colorcode);
        log.info("상품 상세 정보 Test : " + result);
    }
    
    // 상품 컬러 리스트 테스트
    @Test
    public void productGetColorTest() {
        String pid = "O22CAWJC381W";
        List<ProductColorVO> result = mapper.productGetColor(pid);
        for(ProductColorVO vo : result) {
            log.info("상품 컬러 데이터 : " + vo);
        }
    }
    
    // 상품 재고 리스트 테스트
    @Test
    public void productGetStockTest() {
        String pid = "O22CAWJC381W";
        String colorcode = "O22CAWJC381W_IV";
        List<ProductStockVO> result = mapper.productGetStock(pid, colorcode);
        for(ProductStockVO vo : result) {
            log.info("상품 사이즈 데이터 : " + vo);
        }
    }
    
    //상품리스트 페이징 테스트
    @Test
    public void getListWithPagingTest() {
        Criteria cri = new Criteria();
        cri.setPageNum(3);
        cri.setAmount(10);
        
        List<ProductVO> list = mapper.getListWithPaging(cri, "여성", "아우터", "재킷");
        for(ProductVO i : list) {
            log.info(i);
        }
    }
    
    // 브랜드별 상품리스트 테스트
    @Test
    public void getListWithPagingBrandTest() {
        Criteria cri = new Criteria();
        cri.setPageNum(3);
        cri.setAmount(10);
        
        String bname = "BALLY";
        
        List<ProductVO> result = mapper.getListWithPagingBrand(cri, bname);
        
        for(ProductVO vo : result) {
            log.info("브랜드별 상품리스트 : " + vo);
        }
    }
    // 페이징 시 필요한 총 상품 개수 테스트
    @Test
    public void getTotalTest() {
        int result = mapper.getTotal("여성", "아우터", "재킷");
        log.info("페이징 시 필요한 총 상품 개수 : " + result);
    }
    
    // 브랜드별 총 상품개수
    @Test
    public void getTotalBrandTest() {
        String bname = "BALLY";
        int result = mapper.getTotalBrand(bname);
        log.info("브랜드별 총 상품 개수 : " + result);
    }
    
}
