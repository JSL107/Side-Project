package com.hdsm.persistence;

import com.hdsm.domain.CouponVO;
import org.apache.ibatis.annotations.Param;

public interface CouponMapper {
    public void eventCoupon(@Param("ccode") String ccode, @Param("event_eid") Integer event_eid, @Param("member_mid") String member_mid, @Param("cname") String cname);

    public Integer getUserInfoForCoupon(@Param("member_mid") String member_mid, @Param("event_eid") Integer event_eid);

    public void deleteKakaoMember(String mid);

    public void useCoupon(String ccode);

    public void useCancel(String ccode);
}
