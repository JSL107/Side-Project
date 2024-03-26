package com.hyundai.handsome.service;

import java.util.List;

import com.hyundai.handsome.vo.CartVO;

//작성자 : 김가희 , 김나형

public interface CartService {

    // cart 추가
    public void cartAdd(String mid, CartVO cart);

    // 한 member의 cart List 조회 
    public List<CartVO> cartList(String mid) throws Exception;
    
    // cart 조회
    public CartVO cartSelect(int cid);

    // cart 삭제
    public int cartDelete(List<Integer> cid) throws Exception;
    
    // cart 수량변경
    public void cartUpdate(int cid, int qty);
    
    // cart 옵션변경
    public int updateOption(int cid,String colorcode,String size);
    
    // cart 개수세기
    public int cartCnt(String mid);

}
