package com.hdsm.persistence;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hdsm.domain.MemberSbagDTO;
import com.hdsm.domain.MemberSbagDTOForJsp;
import com.hdsm.domain.ProductVO;
import com.hdsm.domain.ThumbnailColorVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberMapperTest2 {
	
	@Autowired
	private MemberMapper mapper;
	
	@Test
	public void testGetSb() {
		
		List<MemberSbagDTO> dto = mapper.getMembersShoppingBag("asd");
		List<MemberSbagDTOForJsp> list = new ArrayList<MemberSbagDTOForJsp>();
		
		for ( MemberSbagDTO i : dto){
			String pid = i.getPid();
			ProductVO pvo = mapper.getShoppingBagsProduct(pid);
			List<ThumbnailColorVO> cvo = mapper.getProductsColor(pid);
			
			MemberSbagDTOForJsp insertdto = new MemberSbagDTOForJsp();
			
			String thumbnailImg = "";
			for ( ThumbnailColorVO j : cvo){
				if(j.getCname().equals(i.getPcolor())) {
					thumbnailImg = j.getC_thumbnail1();
				}
			}
			insertdto.setThumbnail(thumbnailImg);
			insertdto.setBname(pvo.getBname());
			insertdto.setPname(pvo.getPname());
			insertdto.setScolor(i.getPcolor());
			insertdto.setSsize(i.getPsize());
			insertdto.setAmount(i.getPamount());
			insertdto.setPprice(pvo.getPprice());
			insertdto.setColorlist(cvo);
			
			list.add(insertdto);
		}
		
		for( MemberSbagDTOForJsp i : list) {
			log.info(i);
		}
	}
}
