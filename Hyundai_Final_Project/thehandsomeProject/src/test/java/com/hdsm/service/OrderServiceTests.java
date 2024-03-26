package com.hdsm.service;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hdsm.domain.OrderItemVO;
import com.hdsm.domain.OrderUserVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class OrderServiceTests {

	@Autowired
	OrderService orderservice;

	@Autowired
	MemberService memberservice;

	//주문자의 정보를 입력받는 서비스 테스트
	@Test
	public void insertOrderUserTest() {
		OrderUserVO ouv=new OrderUserVO();
		ouv.setMid("minchans");
		ouv.setOid("minchans_2022/10/23/5/05");
		ouv.setOzipcode(1);
		ouv.setOaddress1("강서구");
		ouv.setOaddress2("곰달래");
		ouv.setOtel("010-1111-1111");
		ouv.setOcal("02-2698-5058");
		ouv.setOreceiver("김민찬");
		ouv.setStrpayment("inicis");
		ouv.setOmessage("안녕하세요!");
		ouv.setOusermilege(1111);
		
		ouv.setOusedcoupondetail("1");
		ouv.setOdiscounted(1111);

		orderservice.insertOrderUser(ouv);
	}

	//주문을 하는 동시에 쇼핑백 안에 있는 상품을 삭제하는 테스트
	@Test
	public void deleteshoppingbagTest() {

			OrderUserVO ouv= new OrderUserVO();
			ouv.setMid("minchan");
			List<OrderItemVO> olv=new ArrayList<>();
			OrderItemVO oiv= new OrderItemVO();
			oiv.setPid("SJ2C7WBL673W");
			oiv.setSsize("82");
			oiv.setCcolorcode("SJ2C7WBL673W_MY");
			oiv.setOamount(1);
			olv.add(oiv);
			ouv.setOrders(olv);
			orderservice.deleteShoppingbag(ouv);

	}
	
}
