package com.hyundai.handsome.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

//작성자 : 김가희 , 김나형

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CategoryVO {
    //	카테고리 대분류
    private String clarge;
    //	카테고리 중분류
    private String cmedium;
    //	카테고리 소분류
    private String csmall;
}
