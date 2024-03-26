
package com.hdsm.controller;

import java.util.HashMap;
import java.util.Map;

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

import com.fasterxml.jackson.databind.ObjectMapper;
import com.hdsm.domain.ReviewDTO;
import com.hdsm.persistence.ReviewMapper;

import lombok.extern.log4j.Log4j;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
    "file:src/main/webapp/WEB-INF/spring/security-context.xml" })
@Log4j
public class ReviewControllerTests {

	
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
	public void reviewList() throws Exception {
		log.info(
				mockMvc.perform(
				MockMvcRequestBuilders.post("/review/reviewList")
					.param("pid", "MN2C8WJC022WP2")
				).andReturn()
				.getModelAndView()
				//.getModelMap()
				);
	}
	

	@Test
	public void getlistListWithPaging() throws Exception {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("pid", "MN2C8WJC022WP2");
		map.put("amount", "4");
		map.put("pageNum", "1");

		log.info(
				mockMvc.perform(
				MockMvcRequestBuilders.post("/review/getlistListWithPaging")
					.param("map", "MN2C8WJC022WP2")
				).andReturn()
				.getModelAndView()
				//.getModelMap()
				);
	}
	
	

	@Test
	public void reviewWriteCheck() throws Exception {
		ReviewDTO dto = new ReviewDTO();
		dto.setPid("MN2C8WJC022WP2");
		dto.setMid("admin");
		

		log.info(
				mockMvc.perform(
				MockMvcRequestBuilders.post("/review/reviewWriteCheck")
					.param("dto", "MN2C8WJC022WP2")
				).andReturn()
				.getModelAndView()
				//.getModelMap()
				);
	}
	
	

	@Test
	public void reviewWrite() throws Exception {
		ReviewDTO dto = new ReviewDTO();
		// 임의로 넣을 map 데이터 생성
		Map<String, Object> map = new HashMap<>(); 
		map.put("age", "18세 이하");
		map.put("height", "170");
		map.put("enjoySize", "XL");
		map.put("bodyType", "마른 체형");
		map.put("rating", "5");
		map.put("realWearSize1", "1");
		map.put("realWearSize2", "2");
		map.put("realWearSize3", "3");
		map.put("realProductColor", "2");
		map.put("headline", "리뷰 내용입니다.");
		map.put("fileText", "/resources/images/write_star_score_1807.png");
		
		
		//map을 json으로 변환
		ObjectMapper objectMapper = new ObjectMapper();
		String rcontent = objectMapper.writeValueAsString(map);
		
		dto.setRcontent(rcontent);
		dto.setMid("admin");
		dto.setMname("관리자");
		dto.setMgrade("silver");
		dto.setPid("MN2C8WJC024WP");
		dto.setPname("글리터링 시퀸 재킷");
		dto.setPcolor("BLACK");
		dto.setPsize("88");
		dto.setBname("MINE");
		dto.setRprice(1050000);	

		log.info(
				mockMvc.perform(
				MockMvcRequestBuilders.post("/review/reviewWrite")
					.param("dto", "dto")
				).andReturn()
				.getModelAndView()
				//.getModelMap()
				);
	}
	
	@Test
	@PreAuthorize("isAuthenticated()")
	public void testReviewList() throws Exception {
		log.info(
				mockMvc.perform(
				MockMvcRequestBuilders.post("/review/reviewList")
				.param("pid", "SH2C9ASZ092M")
				).andReturn()
				.getModelAndView()
				//.getModelMap()
				);
	}//end testList
}
