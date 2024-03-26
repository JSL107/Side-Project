package com.hdsm.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hdsm.domain.MemberSbagDTO;
import com.hdsm.domain.MemberVO;
import com.hdsm.domain.ProductVO;
import com.hdsm.domain.ThumbnailColorVO;

public interface MemberMapper2 {
	
//	public List<MemberVO> getList(MemberVO member);
	
	// 회원가입
	public void insertMember(MemberVO member);
	
	//회원 장바구니 목록
	public List<MemberSbagDTO> getMembersShoppingBag(@Param("mid") String mid);
	
	//장바구니에 있는 물건들의 정보들 가져오기
	public ProductVO getShoppingBagsProduct(@Param("pid") String pid);
	
	//그물건들의 각각 colorVO 값들 
	public List<ThumbnailColorVO> getProductsColor(@Param("pid") String pid);

	// 장바구니 변경
	public int updateShoppingBag(MemberSbagDTO msVO);
	
	// 장바구니 내역 조회
	public int selectShoppingBag(MemberSbagDTO msVO);
	
	// 장바구니 삭제
	public int deleteShoppingBag(@Param("msList")List<MemberSbagDTO> msList);
}
