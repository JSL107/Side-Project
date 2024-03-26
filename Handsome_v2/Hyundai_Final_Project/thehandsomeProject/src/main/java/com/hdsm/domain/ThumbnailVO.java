package com.hdsm.domain;

import java.util.List;

import lombok.Data;

@Data
public class ThumbnailVO {
	private String pid;
	private String bname;
	private String pname;
	private int pprice;
	private List<String> p_size;
	private List<ThumbnailColorVO> colorList;
	
}
