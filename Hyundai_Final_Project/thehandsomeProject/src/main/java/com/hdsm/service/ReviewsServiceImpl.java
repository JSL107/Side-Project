

package com.hdsm.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hdsm.domain.Criteria;
import com.hdsm.domain.ReviewsDTO;
import com.hdsm.domain.ReviewsVO;
import com.hdsm.persistence.ReviewsMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ReviewsServiceImpl implements ReviewsService {
	@Autowired
	private ReviewsMapper mapper;

	//상품평 작성 
	@Override
	public void reviewsInsert(ReviewsVO vo){
		mapper.reviewsInsert(vo);
	}
	
	@Override
	public boolean chkReviews(String oid, String pid) {
		int result = mapper.chkReviews(oid, pid);
		if(result > 0)
			return true;
		else
			return false; 
	}
	
	@Override
	public ReviewsDTO getReview(String oid, String ccolorcode) {
		return mapper.getReview(oid, ccolorcode);
	}
	
	// 상품평 리스트
	@Override
	public List<ReviewsDTO> getReviewList(@Param("pid") String pid){
		return mapper.getReviewList(pid);
	}
		
	// 상품평 리스트 페이징처리
	@Override
	public List<ReviewsDTO> getReviewListWithPaging(String pid, Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getReviewListWithPaging(pid, cri);
	}
	
	@Override
	public ReviewsVO checkReviewWrite(String mid, String pid) {
		return mapper.checkReviewWrite(mid, pid);
	}
	
	// 회원 상품평 개수 카운트
	@Override
	public int UserReviewCount(String mid) {
		// TODO Auto-generated method stub
		return mapper.UserReviewCount(mid);
	}
		
}
