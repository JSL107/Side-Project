package com.hdsm.domain.product;

import java.sql.Date;

import lombok.Data;

@Data
public class ProductVO {
	private String pid;
	private String bname;
	private String clarge;
	private String cmedium;
	private String csmall;
	private String pname;
	private int pprice;
	private String pdetail;
	private String p_info;
	private String p_item;
	private String p_material;
	private String p_color;
	private String p_size;
	private String p_country;
	private String p_manufacturer;
	private String p_madedate;
	private int p_salesVolume;
	private Date p_registrationdate;
	
	
}
