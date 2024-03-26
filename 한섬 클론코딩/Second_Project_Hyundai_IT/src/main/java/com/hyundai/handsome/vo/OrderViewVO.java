package com.hyundai.handsome.vo;

import lombok.Data;

//작성자: 이준석
@Data
public class OrderViewVO {
//    브랜드 이름
    private String bname;
//    상품 이름
    private String pname;
//    색상
    private String ccolorname;
//    할인가
    private Double saleprice;
//    유저 이름
    private String mname;
//    유저 휴대폰 번호
    private String mtel;
//    유저 이메일
    private String memail;
//    유저 포인트
    private Integer mpoint;
//    상품 사이즈
    private String ssize;
//    상품 가격
    private Integer pprice;
//    상품 이미지
    private String cimage3;
//    쿠폰 이름
    private String cname;
//    최대 할인가
    private Integer elimit;
//    상품 수량
    private int pamount;
   
}
