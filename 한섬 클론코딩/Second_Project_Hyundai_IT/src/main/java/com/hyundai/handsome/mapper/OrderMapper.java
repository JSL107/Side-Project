package com.hyundai.handsome.mapper;

import com.hyundai.handsome.vo.MyPageOrderViewVO;
import com.hyundai.handsome.vo.OrderVO;
import com.hyundai.handsome.vo.OrderViewVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

//작성자 : 이준석
public interface OrderMapper {
//    작성자 : 이준석
    public OrderViewVO getOrderInfo(@Param("mid") String mid, @Param("pid") String pid, @Param("ccolorcode") String ccolorcode, @Param("ssize") String ssize);

//  결제 완료가 되었을 때 주문 테이블에 담기위한 메소드  
    
//   OrderList 테이블에 값을 넣기 위한 메소드
    public void addOrderList(
            @Param("mid") String mid,
            @Param("ozipcode") Integer ozipcode,
            @Param("oaddress1") String oaddress1,
            @Param("oaddress2") String oaddress2,
            @Param("oreceiver") String oreceiver,
            @Param("otel") String otel,
            @Param("ousedpoint") Integer ousedpoint,
            @Param("ousedcoupon") Integer ousedcoupon,
            @Param("opayment") Integer opayment,
            @Param("ostatus") Integer ostatus,
            @Param("odiscounted") Integer odiscounted);

    //   OrderItem 테이블에 값을 넣기 위한 메소드
    public void addOrderItem(
            @Param("pid") String pid,
            @Param("ccolorcode") String ccolorcode,
            @Param("ssize") String ssize,
            @Param("oamount") Integer oamount);

    public List<MyPageOrderViewVO> selectOrderList(@Param("mid") String mid);

    public Integer getOrder(String mid);
}
