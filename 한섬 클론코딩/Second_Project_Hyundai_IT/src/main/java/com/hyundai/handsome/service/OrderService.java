package com.hyundai.handsome.service;

import com.hyundai.handsome.vo.MyPageOrderViewVO;
import com.hyundai.handsome.vo.OrderViewVO;

import java.util.List;

/**
 * OrderService
 *
 * @author 김찬중, 이준석
 * @since 10.06

 */

//
public interface OrderService {
    // order_view VIEW에 있는 주문 데이터 가져와서 주문하기 창에 표시 해주기
    public OrderViewVO getOrderInfo(String mid, String pid, String ccolorcode, String ssize);

//    장바구니에서 주문하기
    public void addOrderList(String mid, Integer ozipcode, String oaddress1, String oaddress2, String oreceiver, String otel,
                            Integer ousedcoupon,Integer ousedpoint, Integer opayment, Integer ostatus, Integer odiscounted);
//    바로주문
    public void addOrderItem(String pid, String ccolorcode, String ssize, Integer oamount);

    //    마이페이지에서 구현 상품 띄우기
    public List<MyPageOrderViewVO> selectOrderList(String mid);

    //    주문 번호 가져오기
    Integer getOrder(String mid);
}
