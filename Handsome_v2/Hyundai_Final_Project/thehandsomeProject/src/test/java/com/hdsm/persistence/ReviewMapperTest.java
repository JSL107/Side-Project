
package com.hdsm.persistence;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.hdsm.domain.Criteria;
import com.hdsm.domain.ReviewDTO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReviewMapperTest {

	@Autowired
	private ReviewMapper mapper;
	

	@Test
	public void reviewInsert() throws Exception {
		//값을 담을 dto 객체
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
		
		mapper.reviewInsert(dto);
	}
	

	@Test
	public void getReviewList() throws Exception{
		String pid = "MM2C9LOT212M";
		List<ReviewDTO> list = mapper.getReviewList(pid);
		ObjectMapper objectMapper = new ObjectMapper();
		for(ReviewDTO dto : list) {
			Map<String, Object> stringTomap = objectMapper.readValue(dto.getRcontent(),new TypeReference<Map<String,Object>>(){});
		}
	}
	

	@Test
	public void getReviewListWithPaging() throws Exception{
		String pid = "MN2C8WJC022WP2";
		Criteria cri = new Criteria(1,4);
		mapper.getReviewListWithPaging(pid, cri);
	}
	
	

	@Test
	public void getReviewCount() throws Exception{
		String pid = "MN2C8WJC022WP2";
		String mid = "admin";
		String pcolor = "BK";
		String psize = "88";
		mapper.getReviewCount(pid, mid, pcolor, psize);
	}

	@Test
	public void UserReviewCount() throws Exception{
		String mid = "admin";
		mapper.UserReviewCount(mid);
	}
	

	@Test
	public void getReviewMemberList() throws Exception{
		String pid = "MN2C8WJC022WP2";
		String mid = "admin";
		mapper.getReviewMemberList(pid, mid);
	}
	
}
