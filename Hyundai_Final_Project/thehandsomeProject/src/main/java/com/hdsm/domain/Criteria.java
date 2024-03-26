package com.hdsm.domain;

import lombok.Data;

@Data
public class Criteria {
	private int pageNum;
	private int amount;
	
	public Criteria() {
		this(1,12);
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}//

	public Criteria(int pageNum) {
		this.pageNum = pageNum;
		this.amount = 12;
	}//
}
