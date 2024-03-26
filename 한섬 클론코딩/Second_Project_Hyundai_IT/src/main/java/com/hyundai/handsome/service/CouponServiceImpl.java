package com.hyundai.handsome.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hyundai.handsome.mapper.CouponMapper;
import com.hyundai.handsome.vo.CouponVO;

import java.util.List;

// 작성자 : 이준석 , 김찬중
@Service
public class CouponServiceImpl implements CouponService{

    @Autowired
    private CouponMapper couponMapper;

//    event 페이지에서 쿠폰 ID, 상품 ID, 멤버 ID, 쿠폰이름값을 Coupon 데이터 베이스에 insert
    @Override
    public void eventCoupon(String ccode, Integer eid, String mid, String cname) throws Exception{
    	couponMapper.eventCoupon(ccode, eid, mid, cname);
    }

//    쿠폰 객체(CouponVO)을 인자값으로 받아 쿠폰 데이터 insert
    @Override
    public void addCoupon(CouponVO coupon) throws Exception {
        couponMapper.addCoupon(coupon);
    }
    
//  마이페이지에서 유저가 가지고 있는 쿠폰이 개수를 표시
    @Override
    public Integer getCouponCount(String mid) throws Exception {
        return couponMapper.getCouponCount(mid);
    }

//    회원이 가지고 있는 쿠폰의 상세정보 표시
    @Override
    public CouponVO getCoupon(String mid) throws Exception {
        return couponMapper.getCoupon(mid);
    }

//    회원이 가지고있는 쿠폰의 리스트 표시
    @Override
    public List<CouponVO> getCouponList (String mid) throws Exception {
        return couponMapper.getCouponList(mid);
    }

//   쿠폰의 ID를 통해서 쿠폰의 이벤트 ID 표시
    @Override
    public Integer getCouponEid(String ccode) throws Exception {
        return couponMapper.getCouponEid(ccode);
    }

}