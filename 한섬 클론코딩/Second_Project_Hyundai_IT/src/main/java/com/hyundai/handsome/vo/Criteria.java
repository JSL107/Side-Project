package com.hyundai.handsome.vo;

import lombok.Getter;
import lombok.Setter;

/* 작성자 : 김가희, 김나형, 김찬중
 * 페이징에 필요한 정보를 저장하는 객체
 */
@Getter
@Setter
public class Criteria {

    /* 현재 페이지 번호 */
    private int pageNum;

    /* 페이지 표시 개수 */
    private int amount;

    /* 검색 키워드 */
    private String keyword;

    /* Criteria 생성자 */
    public Criteria(int pageNum, int amount) {
        this.pageNum = pageNum;
        this.amount = amount;
    }

    /* Criteria 기본 생성자 */
    public Criteria() {
        this(1, 12);
    }

    @Override
    public String toString() {
        return "Criteria [pageNum=" + pageNum + ", amount=" + amount + ", keyword=" + keyword + "]";
    }

}// end class
