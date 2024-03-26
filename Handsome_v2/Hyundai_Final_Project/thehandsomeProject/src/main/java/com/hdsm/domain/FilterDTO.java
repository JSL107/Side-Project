package com.hdsm.domain;

import java.util.List;

import lombok.Data;

@Data
public class FilterDTO {
	private List<String> bnames;
	private String color;
	private List<String> sizes;
	private Integer price1;
	private Integer price2;
	private String orderBy;
}
