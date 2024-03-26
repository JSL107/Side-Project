package com.hdsm.persistence;

import java.util.List;

import com.hdsm.domain.PersonalColorVO;
import com.hdsm.domain.ProductVO;

public interface MakeupMapper {

	//계절별 컬러 정보 조회
	public List<PersonalColorVO> getSeasonalColor(String season);
	
	//선택한 색상에 라벨링된 데이터 조회
	public List<ProductVO> getCosmetics(String rgb);
}
