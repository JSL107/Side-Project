package com.hdsm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hdsm.domain.PersonalColorVO;
import com.hdsm.domain.ProductVO;
import com.hdsm.persistence.MakeupMapper;

import lombok.AllArgsConstructor;
import lombok.extern.java.Log;

@Service
@AllArgsConstructor
@Log
public class MakeupServiceImpl implements MakeupService {

	@Autowired
	private MakeupMapper makeupmapper;
	
	@Override
	public List<PersonalColorVO> getSeasonalColor(String season) {
		if (season.startsWith("봄")) 
			season = "봄";
		if (season.startsWith("여름")) 
			season = "여름";
		if (season.startsWith("가을")) 
			season = "가을"; 
		if (season.startsWith("겨울"))
			season = "겨울";
		
		return makeupmapper.getSeasonalColor(season);
	}

	@Override
	public List<ProductVO> getCosmetics(String hexColor) {
		int r = Integer.valueOf(hexColor.substring(1, 3), 16);
        int g = Integer.valueOf(hexColor.substring(3, 5), 16);
        int b = Integer.valueOf(hexColor.substring(5, 7), 16);
        
        log.info("rgb(" + r + ", " + g + ", " + b + ")");
		return makeupmapper.getCosmetics("rgb(" + r + ", " + g + ", " + b + ")");
	}

}
