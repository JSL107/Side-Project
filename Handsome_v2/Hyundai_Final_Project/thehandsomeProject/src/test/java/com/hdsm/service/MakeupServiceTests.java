package com.hdsm.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MakeupServiceTests {

	@Autowired
	MakeupService makeupservice;
	
	@Test
	public void getSeasonalColorTest() throws Exception {
		String season = "봄";
		makeupservice.getSeasonalColor(season);
	}
}

