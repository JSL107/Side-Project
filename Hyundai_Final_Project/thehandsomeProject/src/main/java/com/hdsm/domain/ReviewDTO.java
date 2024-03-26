package com.hdsm.domain;

import java.sql.Date;
import java.util.Map;

import lombok.Data;

@Data
public class ReviewDTO {
	private int rno;		// 상품평 번호
	private Date rdate;		// 작성일
	private String rcontent;//상품평 내용(CLOB타입으로, 여러 옵션값이 들어있음)
	private String mid;		// 작성자 id
	private String mname;	// 작성자 이름
	private String mgrade;	// 작성자 등급
	private String pid;		// 상품 id
	private String pname;	// 상품 이름
	private String pcolor;	// 구매한 상품 색상 (order에서 받아와야함)
	private String psize; 	// 구매한 상품 사이즈 (order에서 받아와야함)
	private String bname;	// 브랜드 이름
	private int rprice;		// 상품 가격
	
	private Map<String, Object> rcontentMap;
}
