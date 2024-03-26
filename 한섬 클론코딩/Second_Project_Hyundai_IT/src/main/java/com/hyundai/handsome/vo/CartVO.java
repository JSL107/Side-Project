package com.hyundai.handsome.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

//작성자 : 김가희 , 김나형

@Data
@NoArgsConstructor
@AllArgsConstructor

public class CartVO {
//	카트 아이디
    private int cid;
//	회원 아이디
	private String mid;
//	상품 아이디
	private String pid;
//	상품 사이즈
	private String psize;
//	상품 색상
	private String pcolor;
//	상품 수량
	private int pamount;

}
