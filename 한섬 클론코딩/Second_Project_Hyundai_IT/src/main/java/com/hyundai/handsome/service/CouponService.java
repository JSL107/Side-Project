package com.hyundai.handsome.service;

import com.hyundai.handsome.vo.CouponVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

// 작성자 : 이준석 , 김찬중
public interface CouponService {

    //      event 페이지에서 쿠폰 ID, 상품 ID, 멤버 ID, 쿠폰이름값을 Coupon 데이터 베이스에 insert
    public void eventCoupon(String ccode, Integer eid, String mid, String cname) throws Exception;

    //    쿠폰 객체(CouponVO)을 인자값으로 받아 쿠폰 데이터 insert
    public void addCoupon(CouponVO coupon) throws Exception;

    //  마이페이지에서 유저가 가지고 있는 쿠폰이 개수를 표시
    public Integer getCouponCount(String mid) throws Exception;

    //    회원이 가지고 있는 쿠폰의 상세정보 표시
    public CouponVO getCoupon(String mid) throws Exception;

    //    회원이 가지고있는 쿠폰의 리스트 표시
    public List<CouponVO> getCouponList(String mid) throws Exception;

    //   쿠폰의 ID를 통해서 쿠폰의 이벤트 ID 표시
    public Integer getCouponEid(String ccode) throws Exception;

}
