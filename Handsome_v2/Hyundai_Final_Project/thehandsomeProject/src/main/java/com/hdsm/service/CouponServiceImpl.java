package com.hdsm.service;

import com.hdsm.domain.CouponVO;
import com.hdsm.persistence.CouponMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class CouponServiceImpl implements CouponService {
    @Autowired
    CouponMapper couponMapper;


    @Override
    public void eventCoupon(String ccode, Integer event_eid, String member_mid, String cname) throws Exception {
        couponMapper.eventCoupon(ccode, event_eid, member_mid, cname);
    }

    @Override
    public Integer getUserInfoForCoupon(String member_mid, Integer event_eid) {
        return couponMapper.getUserInfoForCoupon(member_mid, event_eid);
    }

    @Override
    public void useCoupon(String ccode) {
        couponMapper.useCoupon(ccode);
    }

    @Override
    public void useCancel(String ccode) {
        couponMapper.useCancel(ccode);
    }


}
