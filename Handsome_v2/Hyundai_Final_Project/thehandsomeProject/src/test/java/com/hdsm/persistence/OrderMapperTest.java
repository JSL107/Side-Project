package com.hdsm.persistence;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hdsm.domain.CouponVO;
import com.hdsm.domain.MemberVO;
import com.hdsm.domain.MileageVO;
import com.hdsm.domain.OrderItemVO;
import com.hdsm.domain.OrderUserVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class OrderMapperTest {

		@Autowired
		OrderMapper ordermapper;

		@Autowired
		MemberMapper membermapper;

		//주문한 사용자를 등록하는 테스트
		@Test
		public void insertOrderUser() {
			OrderUserVO ouv=new OrderUserVO();
			ouv.setMid("minchan");
			ouv.setOid("minchan_2022/10/23/5/05");
			ouv.setOzipcode(1);
			ouv.setOaddress1("강서구");
			ouv.setOaddress2("곰달래");
			ouv.setOtel("010-1111-1111");
			ouv.setOcal("02-2698-5058");
			ouv.setOreceiver("김민찬");
			ouv.setOmessage("안녕하세요!");
			ouv.setOpayment(1);
			ouv.setOusermilege(1111);
			ouv.setOusedcoupon(1);
			ouv.setOdiscounted(1111);

			ordermapper.insertOrderUser(ouv);
		}


		//주문한 사용자의 상품목록 등록 테스트
		@Test
		public void insertOrderProduct() {
			OrderUserVO ouv=new OrderUserVO();
			ouv.setMid("minchan");
			ouv.setOid("minchan_2022/10/23/5/05");
			ouv.setOzipcode(1);
			ouv.setOaddress1("강서구");
			ouv.setOaddress2("곰달래");
			ouv.setOtel("010-1111-1111");
			ouv.setOcal("02-2698-5058");
			ouv.setOreceiver("김민찬");
			ouv.setOmessage("안녕하세요!");
			ouv.setOpayment(1);
			ouv.setOusermilege(1111);
			ouv.setOusedcoupon(1);
			ouv.setOdiscounted(1111);
			ordermapper.insertOrderUser(ouv);
			List<OrderItemVO> orders= new ArrayList<OrderItemVO>();
			for(int i=0;i<2;i++) {
				OrderItemVO oiv=new OrderItemVO();
				oiv.setOid("minchan_2022/10/23/5/05");
				oiv.setPid("zzzzzzzz"+i);
				oiv.setCcolorcode("zzzzzzzzz_beize"+i);
				oiv.setSsize("M");
				oiv.setOamount(i+1);
				orders.add(oiv);
			}
			for(int i=0;i<orders.size();i++) {
				ordermapper.insertOrderProduct(orders.get(i));
			}


		}

		//쿠폰 목록을 보는  테스트
		@Test
		public void getCouponTest() {
			ordermapper.getcoupon("minchan");
		}

		//마일리지 포인트를 입력하는 테스트
		@Test
		public void insertMilege() {
			MileageVO miv= new MileageVO();
			miv.setMember_mid("minchan");
			miv.setMicategory("지급완료");
			miv.setMicontent("블라우저:"+1700);
			miv.setMipoint(1100);

			ordermapper.insertMilege(miv);
		}

		//HSpoint 를 수정하는 테스트
		@Test 
		public void updateHSpointTest() {
			MemberVO member=new MemberVO();
			member.setMid("minchan");
			member.setMpoint(700);

			ordermapper.updateHspoint(member);
		}

		//해당하는 아이디에 대한 특정한 쿠폰을 제거
		@Test
		public void deleteCoupon() {
			CouponVO coupon=new CouponVO();
			coupon.setMember_mid("minchan");
			coupon.setCcode("FX2-022-100-6HJ-AG6-24F");
			ordermapper.deleteCoupon(coupon);
		}


}

