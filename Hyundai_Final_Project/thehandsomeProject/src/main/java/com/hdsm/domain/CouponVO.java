package com.hdsm.domain;

import java.sql.Date;

import lombok.Data;

//쿠폰 관리 VO

@Data
public class CouponVO {
	private String ccode;
	private int evnet_eid;
	private String member_mid;
	private String cname;
	private Date cstartdate;
	private Date cenddate;
	private int cstate;
	private double elimit;
}
