package com.hdsm.controller;

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

import lombok.extern.log4j.Log4j;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
	"file:src/main/webapp/WEB-INF/spring/root-context.xml"
	
	})
@Log4j
public class ProductControllerTest {
	
	@Autowired
	private WebApplicationContext ctx;
		
	private MockMvc mockMvc;
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();		
	}//end setup
	
//	@Test
//	public void testList() throws Exception {
//		log.info(
//				mockMvc.perform(
//				MockMvcRequestBuilders.get("/product/list")
//				.param("clarge", "여성")
//				.param("cmedium", "아우터")
//				.param("csmall", "코트")
//				).andReturn()
//				.getModelAndView()
//				.getModelMap()
//				);
//		
//	}//end testList
	//1_1136_1%2E2_0_0_0_0
	@Test
	public void testList() throws Exception {
		log.info(
				mockMvc.perform(
				MockMvcRequestBuilders.get("/product/list/we01/1_1136_1%2E2_0_0_0_0")
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
		log.info(
				mockMvc.perform(
				MockMvcRequestBuilders.get("/product/list/we01/1_1136_1%2E2_0_0_0_1")
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
	public void testProdinfo()throws Exception{
		log.info(
				mockMvc.perform(
						MockMvcRequestBuilders.get("/product/product_detail?pid=CM2C9ASZ756WS&colorcode=CM2C9ASZ756WS_BK")
						).andReturn()
						.getModelAndView()
						.getModelMap()
						);		
	}
}
