package com.hdsm.domain;

import java.util.List;

import lombok.Data;

@Data
public class ReviewAttachFileDTO {
	//private String fileName;
	private String thumbPath;
	private List<String> imagesPath;
	private String uuid;
}
