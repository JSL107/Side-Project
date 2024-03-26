package com.hyundai.handsome.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hyundai.handsome.mapper.CartMapper;
import com.hyundai.handsome.vo.CartVO;

import lombok.extern.log4j.Log4j;

//작성자 : 김가희 , 김나형
@Service
public class CartServiceImpl implements CartService{
    
   @Autowired
   CartMapper mapper;

//   장바구니 상품추가
    @Override
    public void cartAdd(String mid, CartVO cart) {
        //중복상품(상품아이디,색상,사이즈가 같으면)이 있으면 합계 합치기
        if(mapper.cartOverlap(mid, cart)>0) {
            mapper.cartOverlapUpdate(cart.getPamount(), cart.getPcolor(), cart.getPsize());
        }else { //아니면 새로추가하기
        mapper.cartAdd(mid, cart);
        }
    }
    // 한 member의 cart List 조회(카트목록보기)
    @Override
    public List<CartVO> cartList(String mid) throws Exception {
        return mapper.cartList(mid);
    }

    // cart 삭제
    @Override
    public int cartDelete(List<Integer> cid) throws Exception {
        return mapper.cartDelete(cid);
    }

    //    카트수량변경
    @Override
    public void cartUpdate(int cid, int qty) {
       mapper.cartUpdate(cid,qty);
    }


    // cart 옵션변경
    @Override
    public int updateOption(int cid, String colorcode, String size) {
        return mapper.updateOption(cid,colorcode,size);
    }

    // cart 수량변경
    @Override
    public int cartCnt(String mid) {
        return mapper.cartCnt(mid);
    }

    // cart 조회(cid별 장바구니 상세내역 불러오기)
    @Override
    public CartVO cartSelect(int cid) {
        return mapper.cartSelect(cid);
    }

}
