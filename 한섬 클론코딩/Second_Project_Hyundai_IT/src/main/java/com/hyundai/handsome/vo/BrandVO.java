package com.hyundai.handsome.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/* 작성자 : 이준석
 * 페이징에 필요한 정보를 저장하는 객체
 */

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class BrandVO {
//	브랜드 넘버
	private int bNo;
//	브랜드 이름
	private String bName;
}
