package com.hyundai.handsome.service;

import com.hyundai.handsome.mapper.OrderMapper;
import com.hyundai.handsome.vo.MyPageOrderViewVO;
import com.hyundai.handsome.vo.OrderViewVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * OrderServiceImpl
 *
 * @author 김찬중, 이준석
 * @since 10.06
 */
@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    OrderMapper orderMapper;

    // order_view VIEW에 있는 주문 데이터 가져와서 주문하기 창에 표시 해주기
    @Override
    public OrderViewVO getOrderInfo(String mid, String pid, String ccolorcode, String ssize) {
        return orderMapper.getOrderInfo(mid, pid, ccolorcode, ssize);
    }

    //    장바구니에서 주문하기
    @Override
    public void addOrderList(String mid, Integer ozipcode, String oaddress1, String oaddress2, String oreceiver, String otel,
                             Integer ousedpoint, Integer ousedcoupon, Integer opayment, Integer ostatus, Integer odiscounted) {
        orderMapper.addOrderList(mid, ozipcode, oaddress1, oaddress2, oreceiver, otel, ousedpoint, ousedcoupon, opayment, ostatus, odiscounted);
    }

    //    바로주문
    @Override
    public void addOrderItem(String pid, String ccolorcode, String ssize, Integer oamount) {
        orderMapper.addOrderItem(pid, ccolorcode, ssize, oamount);
    }

    @Override
    public List<MyPageOrderViewVO> selectOrderList(String mid) {
        return orderMapper.selectOrderList(mid);
    }

//    주문 번호 가져오기
    @Override
    public Integer getOrder(String mid){
        return orderMapper.getOrder(mid);
    }
}

// event => 자동
