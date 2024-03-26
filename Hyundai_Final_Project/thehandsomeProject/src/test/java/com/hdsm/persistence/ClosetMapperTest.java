package com.hdsm.persistence;

import static org.junit.Assert.assertNotEquals;

import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ClosetMapperTest {
	@Autowired
	PageCounterMapper mapper;
	
	@Test
	public void testGetclosetindex() {		
		System.out.println(mapper.getclosetindex());
	}
	@Test
	public void test(Map<String, Object> map) {
		map.put("index", 1);
		map.put("viewindex", 2);
		map.put("closetcount", 100);
		mapper.updateClosetCounter(map);
	}
}
