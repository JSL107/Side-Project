package com.hyundai.handsome.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hyundai.handsome.vo.CartVO;

//작성자 : 김가희 , 김나형

public interface CartMapper {

    // 장바구니에 담는 메소드
    public void cartAdd(@Param("mid") String mid, @Param("cart") CartVO cart);

    //장바구니에 동일한 상품이 동일색상,동일사이즈로 있는지 확인하는 메소드
    public int cartOverlap(@Param("mid") String mid, @Param("cart") CartVO cart);

    //장바구니에 동일한 상품이 동일색상,동일사이즈로 있다면 수량을 합치는 메소드
    public int cartOverlapUpdate(@Param("amount") int amount, @Param("pcolor") String pcolor, @Param("psize") String psize);

    //장바구니번호(cid)로 상세내역 조회하는 메소드
    public CartVO cartSelect(int cid);

    //  장바구니 목록 가져오는 메소드
    public List<CartVO> cartList(String mid);

    // 장바구니에 담긴 목록 삭제 메소드
    public int cartDelete(List<Integer> cidList);

    // 장바구니에 담긴 목록중에서 해당 상품(cid)에 대해서 수량(qty)을 변경하는 메소드
    public void cartUpdate(@Param("cid") int cid, @Param("qty") int qty);

    // 장바구니에 담긴 상품(cid)중 색상(color)이나 사이즈(size) 변경하는 메소드
    public int updateOption(@Param("cid") int cid, @Param("color") String colorcode, @Param("size") String size);

    // 장바구니에 담긴 수량을 나타내주는 메소드
    public int cartCnt(String mid);

}
