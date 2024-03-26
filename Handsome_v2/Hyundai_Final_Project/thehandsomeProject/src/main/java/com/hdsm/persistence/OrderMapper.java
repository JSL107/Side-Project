package com.hdsm.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hdsm.domain.AddressVO;
import com.hdsm.domain.CouponVO;
import com.hdsm.domain.MemberVO;
import com.hdsm.domain.MileageVO;
import com.hdsm.domain.OrderCheckVO;
import com.hdsm.domain.OrderItemVO;
import com.hdsm.domain.OrderUserVO;

public interface OrderMapper {

    //주문한 회원의  정보 등록
    public void insertOrderUser(OrderUserVO ouv);

    //회원의 주문한 상품을 등록
    public void insertOrderProduct(OrderItemVO oiv);

    //회원의 사용가능한 쿠폰 조회
    public List<CouponVO> getcoupon(String mid);

    //회원의 사용가능한 쿠폰 및 할인율 조회
    public List<CouponVO> getcouponwithevent(String mid);

    //마일리지를 등록
    public void insertMilege(MileageVO miv);

    //마일리지의 합을 조회
    public int SumMilege(String mid);

    //회원의 hspoint 업데이트
    public void updateHspoint(MemberVO member);

    //회원의 쿠폰 삭제
    public void deleteCoupon(CouponVO coupon);

    //회원의 배송지 관리 목록을 가져온다.
    public List<AddressVO> getAddress(String mid);

    //주문한 회원의 정보를 조회
    public OrderUserVO getOrderUserItem(String oid);
	
    //주문 번호에 대한 주문 상품들을 조회
    public List<OrderItemVO> getOrderItem(String oid);

    //회원 아이디에 대한 주문한 사용자 정보를 조회
    public List<OrderUserVO> getOrderUserVO(String mid);


    //회원 주문 정보를 삭제
    public void deleteOrderUser(String oid);

    //회원의 주문 상품들을 삭제
    public void deleteOrderItem(String oid);

    //회원의 마일리지 정보도 삭제
    public void deleteMilege(String oid);

    //회원이 최근 주문한 상품을 조회
    public OrderUserVO getRecentOrderUserVO(String mid);

    //회원의 쿠폰 개수를 조회
    public int getCouponCount(String mid);


    //회원 아이디와 상품 id에 대한 주문 내역 확인
    public int getOrderCheck(String pid, String mid);

    //회원 아이디와 상품 id에 대한 주문 내역 확인
    public List<OrderCheckVO> getOrderCheckVO(@Param("pid") String pid, @Param("mid") String mid);

    //주문번호와 일치하는 제품의 제품정보 반환(사이즈, 컬러이름)
    public List<OrderItemVO> getOrderItemProductInfo(@Param("oid") String oid);

    public OrderUserVO getOrderInfo(@Param("mid") String mid, @Param("oid") String oid);

	//회원 주문 정보를 삭제
	public void cancleOrderUser(String oid);

	
}
