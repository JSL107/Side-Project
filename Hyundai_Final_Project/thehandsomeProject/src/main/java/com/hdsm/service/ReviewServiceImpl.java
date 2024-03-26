

package com.hdsm.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hdsm.domain.Criteria;
import com.hdsm.domain.ReviewDTO;
import com.hdsm.persistence.ReviewMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ReviewServiceImpl implements ReviewService {
	@Autowired
	private ReviewMapper mapper;

	//상품평 작성 
	@Override
	public void reviewInsert(ReviewDTO dto){
		mapper.reviewInsert(dto);
	}
	
	// 상품평 리스트
	@Override
	public List<ReviewDTO> getReviewList(@Param("pid") String pid){
		return mapper.getReviewList(pid);
	}
	
	// 상품평 리스트 페이징처리
	@Override
	public List<ReviewDTO> getReviewListWithPaging(String pid, Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getReviewListWithPaging(pid, cri);
	}
	
	// 상품평 작성 여부 확인
	@Override
	public int getReviewCount(
			@Param("pid") String pid, @Param("mid") String mid,
			@Param("pcolor") String pcolor,@Param("psize") String psize
			) {
		return mapper.getReviewCount(pid, mid, pcolor, psize);
	}


	// 회원 상품평 개
	@Override
	public int UserReviewCount(String mid) {
		// TODO Auto-generated method stub
		return mapper.UserReviewCount(mid);
	}
	
	// 상품평 멤버 조회
	@Override
	public List<ReviewDTO> getReviewMemberList(@Param("pid") String pid, @Param("mid") String mid) {
		return mapper.getReviewMemberList(pid, mid);
	}
	
	// 주문번호를 통한 상품평  조회
	@Override
	public int chkReviews(@Param("oid") String oid) {
		return mapper.chkReviews(oid);
	}
}
