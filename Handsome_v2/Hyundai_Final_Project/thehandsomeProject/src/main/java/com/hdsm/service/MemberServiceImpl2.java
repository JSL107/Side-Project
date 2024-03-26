package com.hdsm.service;



import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hdsm.domain.MemberSbagDTO;
import com.hdsm.domain.MemberSbagDTOForJsp;
import com.hdsm.domain.MemberVO;
import com.hdsm.domain.ProductVO;
import com.hdsm.domain.ThumbnailColorVO;
import com.hdsm.persistence.MemberMapper;
import com.hdsm.persistence.ProductMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class MemberServiceImpl2 implements MemberService2 {

	@Autowired
	private MemberMapper mapper;
	
	@Autowired
	private ProductMapper productmapper;
	
	// 회원 가입
	@Override
	public void insertMember(MemberVO member) {
		mapper.insertMember(member);
	}

	// 아이디 중복 확인
	@Override
	public int idCheck(String memberId) {
		int cnt = mapper.idCheck(memberId);
		System.out.println("cnt : "+cnt);
		return cnt;
	}
	
	// 연락처 중복 확인
	@Override
	public int telCheck(String memberTel) {
		int cnt = mapper.telCheck(memberTel);
		System.out.println("cnt : "+cnt);
		return cnt;
	}

	// 로그인 
	@Override
	public MemberVO login(MemberVO member) {
		return mapper.login(member);
	}

	@Override
	public MemberVO getMember(String memberId) {
		
	return mapper.getMember(memberId);
	}
	
	@Override
	public List<MemberSbagDTOForJsp> getMemberShoppingBag(String mid) {
		
		List<MemberSbagDTO> dto = mapper.getMembersShoppingBag(mid);
		List<MemberSbagDTOForJsp> list = new ArrayList<MemberSbagDTOForJsp>();
		
		for ( MemberSbagDTO i : dto){
			String pid = i.getPid();
			ProductVO pvo = mapper.getShoppingBagsProduct(pid);
			List<ThumbnailColorVO> cvo = mapper.getProductsColor(pid);
			List<String> slist = new ArrayList<String>();
			
			for(String size : pvo.getP_size().split(",")) {
				System.out.println(size);
				slist.add(size.trim());
			}
			
			MemberSbagDTOForJsp insertdto = new MemberSbagDTOForJsp();
			
			String thumbnailImg = "";
			String colorcode = "";
			for ( ThumbnailColorVO j : cvo){
				if(j.getCname().equals(i.getPcolor())) {
					thumbnailImg = j.getC_thumbnail1();
					colorcode = j.getCcolorcode();
					break;
				}
			}
			insertdto.setPid(pid);
			insertdto.setColorcode(colorcode);
			insertdto.setThumbnail(thumbnailImg);
			insertdto.setBname(pvo.getBname());
			insertdto.setPname(pvo.getPname());
			insertdto.setScolor(i.getPcolor());
			insertdto.setSsize(i.getPsize());
			insertdto.setAmount(i.getPamount());
			insertdto.setPprice(pvo.getPprice());
			insertdto.setColorlist(cvo);
			insertdto.setSizeList(slist);
			list.add(insertdto);
		}
		return list;
	}
	
	@Override
	public void insertShoppingBags(MemberSbagDTO msVO) {
		mapper.insertShoppingBags(msVO);
	}
	



}
