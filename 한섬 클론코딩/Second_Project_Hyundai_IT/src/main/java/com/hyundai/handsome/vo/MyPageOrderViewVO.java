package com.hyundai.handsome.vo;

import lombok.Data;

@Data
public class MyPageOrderViewVO {
//    회원 아이디
    private String mid;
//    주문 아이디
    private Integer oid;
//    상품 이름
    private String pname;
//    상품 가격
    private Integer pprice;
//    주문 상태
    private Integer ostatus;
//    상품 카테고리
    private String clarge;
//    수량
    private Integer oamount;
//    상품 이미지
    private String cimage1;
}
