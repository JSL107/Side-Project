package com.hyundai.handsome.vo;

import lombok.Data;

//작성자 : 김가희, 김나형
@Data
public class ProductVO {
	//상품 품번
	private String pid;
	//상품 컬러코드
	private String ccolorcode;
	//브랜드 넘버
	private int bno;
	//브랜드 이름
	private String bname;
	//카테고리 대분류
	private String clarge;
	//카테고리 중분류
	private String cmedium;
	//카테고리 소분류
	private String csmall;
	//상품 이름
	private String pname;
	//상품 상세정보
	private String pdetail;
	//상품 판매수량
	private int ptotalamount;
	//상품가격
	private int pprice;
	//이미지
    private String cimage1;
    private String cimage2;
    private String cimage3;
    private String cimage4;
    private String cimage5;
    private String cimage6;
	

}
