package com.hdsm.domain;

import java.util.List;

import lombok.Data;

@Data
public class MemberWishListDTOforJsp {
	private String pid;
	private ProductVO pvo;
	private String thumbnail;
	private String colorcode;
	private String scolor;
	private String ssize;
	private List<ThumbnailColorVO> colorList;
	private List<String> sizeList;
}
