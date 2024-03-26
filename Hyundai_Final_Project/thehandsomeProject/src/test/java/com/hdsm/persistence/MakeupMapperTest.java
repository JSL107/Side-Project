package com.hdsm.persistence;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hdsm.domain.PersonalColorVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MakeupMapperTest {

	@Autowired
	MakeupMapper makeupmapper;
	
	@Test
	public void getSeasonalColorTest() throws Exception {
		String season = "봄";
		List<PersonalColorVO> lst = makeupmapper.getSeasonalColor(season);
		for (PersonalColorVO color : lst) {
			log.info(color.getPcid() + " " + color.getRgb() + " " + color.getCtg());
		}
	}
}
