package com.hyundai.handsome.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hyundai.handsome.service.CouponService;
import com.hyundai.handsome.vo.CouponVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class couponServiveTests {

	@Autowired
	private CouponService service;

	@Test
	public void couponServiveTests() throws Exception {
		CouponVO coupon = new CouponVO();
		coupon.setCcode("test2");
		coupon.setEid(1);
		coupon.setMid("test2");
		coupon.setCname("test2");
		coupon.setCstate(1);

		service.addCoupon(coupon);
	}
}
