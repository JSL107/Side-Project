package com.hdsm.domain.order;

import lombok.Data;
//주문한 사용자가 주문한 상품 VO(박진수)
@Data

public class OrderCheckVO {
	private String oid;
	private String pid;
	private String mid;
	private String ccolorcode;
	private String ssize;
}
