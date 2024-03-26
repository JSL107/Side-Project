package com.hdsm.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO {
	
	private int startPage;
	private int endPage;
	private boolean prev, next;
	
	private int total;
	private Criteria cri;
	
	private int realEnd;
	
	public PageDTO(Criteria cri,int total) {
		
		this.total = total;
		this.cri = cri;
		
		this.endPage = (int) (Math.ceil( cri.getPageNum() /10.0)) * 10;
		
		this.startPage = this.endPage - 9;
		
		realEnd = (int)  Math.ceil( (total * 1.0) / cri.getAmount() ) ;
		
		//total(전체 데이터수) / amount 를 한 숫자(진짜 끝 수)가 endpage보다 크면 당연히 업데이트 해줘야지
		if ( realEnd < this.endPage) {
			this.endPage = realEnd;
		}//end if
		
		//페이지 기능 활성화 여부 저장
		this.prev = (this.startPage > 1);		
		this.next = (this.endPage < realEnd);		
	}//end PageDTD

}
