package com.hdsm.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class ReviewsVO {
	private String oid;		// 주문번호
	private Date rdate;		// 작성일
	private String rcontent;//상품평 내용(CLOB타입으로, 여러 옵션값이 들어있음)
	private String mid;		// 작성자 id
	private String pid;		// 상품 id
	private String ccolorcode;	// 구매한 상품 색상 (order에서 받아와야함)
}
