package com.hyundai.handsome.vo;

import lombok.Data;

//작성자: 이준석
@Data
public class OrderVO {
//    지번
    private Integer ozipcode;
//    주소
    private String oaddress1;
//    상세주소
    private String oaddress2;
//    수령인
    private String oreceiver;
//    휴대폰 번호
    private String otel;
//    사용한 포인트
    private Integer ousedpoint;
//    사용한 쿠폰
    private Integer ousedcoupon;
//    결제 정보
    private Integer opayment;
//    주문 상태
    private Integer ostatus;
//    할인 금액
    private Integer odiscounted;
//    상품 아이디
    private String pid;
//    상품 색상
    private String ccolorcode;
//    상품 사이즈
    private String ssize;
//    주문 수량
    private Integer oamount;

}