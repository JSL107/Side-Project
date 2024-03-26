
package com.hdsm.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.hdsm.domain.Criteria;
import com.hdsm.persistence.ReviewMapper;

import lombok.extern.log4j.Log4j;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
	"file:src/main/webapp/WEB-INF/spring/root-context.xml" })
@Log4j
public class ReviewControllerTests2 {

	
	@Autowired
	private WebApplicationContext ctx;
		
	private MockMvc mockMvc;
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();		
	}//end setup
	
	@Autowired
	private ReviewMapper reviewmapper;	//ReviewMapper.java 인터페이스 의존성 주입
	
	@Test
	public void testReviewWrite() throws Exception {
		log.info(
				mockMvc.perform(
				MockMvcRequestBuilders.get("/review/reviewWrite")
//				.param("pageNum", "2")
//				.param("ctg", "we000")
//				.param("amount", "10")
//				.param("clarge", "남성")
//				.param("cmedium", "아우터")
//				.param("csmall", "코트")
				).andReturn()
				.getModelAndView()
				.getModelMap()
				);
	}//end testList
	
	@Test
	@PreAuthorize("isAuthenticated()")
	public void testReviewListWithPaging() throws Exception {
		Criteria cri = new Criteria(1,4);
		log.info(
				mockMvc.perform(
				MockMvcRequestBuilders.post("/review/getlistListWithPaging")
				.param("pid", "MU2C1WJC021MMY")
				.param("amount", "4")
				.param("pageNum", "1")
				).andReturn()
				.getModelAndView()
				//.getModelMap()
				);
	}//end testList
}
