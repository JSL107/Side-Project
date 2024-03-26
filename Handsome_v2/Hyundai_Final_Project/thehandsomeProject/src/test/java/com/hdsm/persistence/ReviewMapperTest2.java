
package com.hdsm.persistence;


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
public class ReviewMapperTest2 {

	@Autowired
	private ReviewMapper mapper;
	
	
	//상품평 리스트 페이징 된거 잘 오나 테스트
	@Test
	public void getReviewListWithPaging() throws Exception{
		String pid = "MU2C1WJC021MMY";
		
		Criteria cri = new Criteria(1,4);
		List<ReviewDTO> list = mapper.getReviewListWithPaging(pid, cri);
		ObjectMapper objectMapper = new ObjectMapper();
		log.info("------------list 객체 테스트------------\n" + list.toString()+"------------\n");
		
		for(ReviewDTO dto : list) {
			log.info("------------dto 객체 테스트------------\n" + dto+"------------\n");
			log.info("------------dto rcontent ------------\n" + dto.getRcontent()+"------------\n");
			Map<String, Object> stringTomap = objectMapper.readValue(dto.getRcontent(),new TypeReference<Map<String,Object>>(){});
			
			log.info("------------map rcontent ------------\n" +stringTomap.toString()+"------------\n");
			log.info("------------ rcontent headline ------------\n" +stringTomap.get("headline")+"------------\n");
		}
		
		
		/*
		 * List<ReviewDTO> list = mapper.getReviewList(pid);
		 * 
		 * for(ReviewDTO dto : list) { String rcontent = dto.getRcontent();
		 * log.info("--------rcontent----------\n " + rcontent); }
		 */
	
	}
	
	
}
