package com.hdsm.domain;

import lombok.Data;

@Data
public class PersonalColorVO {

	private String pcid; // 퍼스널 컬러 id
	private String rgb;  // RGB 값
	private String ctg;  // 페이스, 아이, 립 카테고리
}
