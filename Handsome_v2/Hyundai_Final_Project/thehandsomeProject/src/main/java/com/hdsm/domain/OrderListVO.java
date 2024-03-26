package com.hdsm.domain;

import java.util.List;

import lombok.Data;

@Data
public class OrderListVO {
	private List<OrderItemVO> orders;
	
}
