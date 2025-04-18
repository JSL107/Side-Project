package com.hyundai.handsome.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * PageDTO
 * 
 * @author 김가희, 김나형, 김찬중
 * @since 10.13
 * 
 *        <pre>
 * 수정일                 수정자                          수정내용
 * ----------  ---------------      ---------------------------\
 * 2022.10.10    김가희, 김나형               최초생성
 * 2022.10.18    김찬중                          수정
 *        </pre>
 */

@Getter
@Setter
@ToString

//작성자: 김나형
public class PageDTO {
    /* 페이지 시작 번호 */
	private int startPage;
	/* 페이지 끝 번호 */
	private int endPage;
	/* 이전, 다음 버튼 존재 유무 */
	private boolean prev, next;
	/* 전체 마지막 페이지 번호 */
	private int realEnd;
	/* 행 전체 개수 */
	private int total;
	/* 현재페이지 번호(pageNum), 행 표시 수(amount), 검색 키워드(keyword), 검색 종류(type) */
	private Criteria cri;
	/* 생성자(클래스 호출 시 각 변수 값 초기화) */
	public PageDTO(Criteria cri, int total) {
	    /* cri, total 초기화 */
		this.cri = cri;
		this.total = total;
		/* 페이지 끝 번호 */
		this.endPage = (int) (Math.ceil(cri.getPageNum()/10.0)) * 10;
		this.startPage = this.endPage - 9;
		/* 전체 마지막 페이지 번호 */
		realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));
		/* 페이지 끝 번호 유효성 체크 */
		if (realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		/* 이전 버튼 값 초기화 */
		this.prev = this.startPage > 1;
		/* 다음 버튼 값 초기화 */
		this.next = this.endPage < realEnd;
	}
    @Override
    public String toString() {
        return "PageDTO [startPage=" + startPage + ", endPage=" + endPage + ", prev=" + prev + ", next=" + next
                + ", realEnd=" + realEnd + ", total=" + total + ", cri=" + cri + "]";
    } 
	
}
