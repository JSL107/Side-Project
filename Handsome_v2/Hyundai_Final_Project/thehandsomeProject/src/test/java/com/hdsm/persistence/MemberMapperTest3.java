package com.hdsm.persistence;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hdsm.domain.MemberSbagDTO;
import com.hdsm.domain.MemberWishListDTO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberMapperTest3 {
	
	@Autowired
	private MemberMapper2 mapper2;
	@Autowired
	private MemberMapper mapper;
	
	//@Test
	public void testGetSb() {
		List<MemberSbagDTO> mslist = new ArrayList<MemberSbagDTO>();
		MemberSbagDTO dto = new MemberSbagDTO();
		String mid="asd"; 
		String pid = "MN2CAQOT461W"; 
		String psize= "76";
		String pcolor="BROWN";
		int pamount=1;
		
		dto.setMid(mid);
		dto.setPid(pid);
		dto.setPcolor(pcolor);
		dto.setPsize(psize);
		dto.setPamount(pamount);
		
		mslist.add(dto);
		
		mapper2.deleteShoppingBag(mslist);
		
	}
	//@Test
	public void testCountSB() {
		String mid = "asd";
		mapper.getShoppingBagCount(mid);
	}
	
	//@Test
	public void testInsertWishList_and_Count() {
		MemberWishListDTO dto = new MemberWishListDTO();
		dto.setMember_mid("asd");
		dto.setPid("TH2CAWJM336M");
		
		mapper.insertWishList(dto);
		log.info(mapper.getWishListCount("asd"));
		log.info(mapper.isinWishList(dto));
	}
	
	//@Test
	public void testGetUsersWishList() {
		MemberWishListDTO dto = new MemberWishListDTO();
		dto.setMember_mid("asd");
		//테스트 위한 주석처리
		List<MemberWishListDTO> list = mapper.getUsersWishList(dto);
		
		for(MemberWishListDTO d : list) {
			log.info(d);
		}
	}
	@Test
	public void testdeleteWishList() {
		MemberWishListDTO dto = new MemberWishListDTO();
		List<MemberWishListDTO> list = new ArrayList<MemberWishListDTO>();
		dto.setMember_mid("asd");
		dto.setPid("TH2CAWJM336M");
		
		list.add(dto);
		
		int cnt = mapper.deleteWishListItem(list);
		log.info(cnt);
		

	}
}
