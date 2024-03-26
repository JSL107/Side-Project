package com.hyundai.handsome.mapper;

import com.hyundai.handsome.vo.CouponVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * CouponMapper
 *
 * @author 이준석
 * @since 10.06
 *
 * <pre>
 * 수정일                 수정자                         수정내용
 * ----------  ---------------    ---------------------------
 * 2022.10.06    이준석                        최초 생성
 * 2022.10.15	 이준석						  메소드 구현
 *        </pre>
 */
public interface CouponMapper {
    //	이벤트 쿠폰에서 쿠폰 번호(ccode), 이벤트 번호(eid), 회원 아이디(mid), 쿠폰 이름(cname)을 통해 해당되는 유저에게 쿠폰을 발급하는 메소드
    public void eventCoupon(@Param("ccode") String ccode, @Param("eid") Integer eid, @Param("mid") String mid, @Param("cname") String cname);

    //	CouponVo 파라미터를 통해 쿠폰을 발급해주는 메소드
    public void addCoupon(CouponVO coupon);

    //	회원 아이디(mid)를 통해 쿠폰의 개수를 가져오는 메소드 (마이페이지에서 개수를 나타내줌)
    public Integer getCouponCount(String mid);

    //	회원 아이디(mid)를 통해 쿠폰의 정보를 가져오는 메소드
    public CouponVO getCoupon(String mid);

    // 회원 아이디(mid)를 통해 보유하고 있는 쿠폰의 리스트를 보여주는 메소드
    public List<CouponVO> getCouponList(String mid);

//    쿠폰의 이름을 통해 몇번의 이벤트로 부터 발생되었는지 알기 위한 메소드
    public Integer getCouponEid(String ccode);

}