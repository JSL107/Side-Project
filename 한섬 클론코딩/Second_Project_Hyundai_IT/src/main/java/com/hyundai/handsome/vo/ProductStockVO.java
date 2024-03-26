package com.hyundai.handsome.vo;

import lombok.Data;

//작성자: 김가희 , 김나형
@Data
public class ProductStockVO {
//    상품 아이디
    private String pid;
//    색상 코드
    private String ccolorcode;
//    상품 사이즈
    private String ssize;
//    재고
    private int samount;
}
