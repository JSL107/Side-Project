package com.hdsm.domain.datastatistics;

import java.sql.Date;

import lombok.Data;

@Data
public class ClosetDTO {
	private int views1;
	private int views2;
	private int views3;
	private int views4;
	private int views5;
	private int views6;
	private int views7;
	private int views8;
	
	private String v1date;
	private String v2date;
	private String v3date;
	private String v4date;
	private String v5date;
	private String v6date;
	private String v7date;
	private String v8date;
	
	private Date viewdate;
	private int viewupdate;
}
