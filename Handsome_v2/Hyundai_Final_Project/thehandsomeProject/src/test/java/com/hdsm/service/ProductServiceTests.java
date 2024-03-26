package com.hdsm.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hdsm.domain.ProductVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ProductServiceTests {

	@Autowired
	private ProductService service;
	
	@Test
	public void testGetList() {
		ProductVO product=new ProductVO();
		product.setClarge("여성");
		product.setCmedium("아우터");
		/* product.setCsmall("재킷"); */
		service.getList(product).forEach(board -> log.info(board));		
	}//end void
	
	@Test
	public void testGetThumbnailListWithPaging() {
		
	}

	@Test
	public void styleCountTest() {
		String words = "페미닌";
		log.info(service.styleSearchedCount(words));
	}
}
