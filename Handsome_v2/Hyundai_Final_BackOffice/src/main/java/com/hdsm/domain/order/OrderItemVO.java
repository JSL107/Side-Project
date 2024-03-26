package com.hdsm.domain.order;

import com.hdsm.domain.product.ProductVO;

import lombok.Data;


@Data
public class OrderItemVO {
	private String oid;
	private String pid;
	private String ccolorcode;
	private String ssize;
	private int oamount;
	private int oprice;
	private int point;
	private int milege;
	private int totalprice;
	private int totalpoint;
	private ProductVO productVO;
	
	
	private String cname;
	
}
