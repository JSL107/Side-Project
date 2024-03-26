package com.hdsm.domain;

import java.util.List;

import lombok.Data;

@Data
public class MemberSbagDTO {
	private String mid;
	private String pid;
	private String psize;
	private String pcolor;
	private int pamount;
	
	// MemberSbagDTO에 있는 값들을 msBagDtoList 리스트에 담음
	private List<MemberSbagDTO> msBagDtoList;
}
