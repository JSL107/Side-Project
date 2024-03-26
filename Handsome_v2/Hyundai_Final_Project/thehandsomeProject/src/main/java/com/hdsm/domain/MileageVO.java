package com.hdsm.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class MileageVO {
	private int mino;
	private String member_mid;
	private String micategory;
	private String micontent;
	private Date miregdate;
	private int mipoint;
}
