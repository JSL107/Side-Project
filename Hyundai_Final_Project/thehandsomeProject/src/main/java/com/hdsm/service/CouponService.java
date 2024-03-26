package com.hdsm.service;


import com.hdsm.domain.CouponVO;


public interface CouponService {
    public void eventCoupon(String ccode, Integer event_eid, String member_mid, String cname) throws Exception;

    public Integer getUserInfoForCoupon(String member_mid, Integer event_eid) throws Exception;

    public void useCoupon(String ccode);

    public void useCancel(String ccode);


}
