package com.hdsm.domain;

import java.util.List;

import lombok.Data;

@Data
public class MemberSbagDTOForJsp {
	private String pid;
	private String colorcode;
	private String thumbnail;
	private String bname;
	private String pname;
	private String scolor;
	private String ssize;
	private int amount;
	private int pprice;
	private List<ThumbnailColorVO> colorlist;
	private List<String> sizeList;
}
