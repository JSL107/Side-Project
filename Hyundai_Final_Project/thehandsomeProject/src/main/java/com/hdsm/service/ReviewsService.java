
package com.hdsm.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hdsm.domain.Criteria;
import com.hdsm.domain.ReviewsDTO;
import com.hdsm.domain.ReviewsVO;

public interface ReviewsService {
	
	// 상퓸평 등록
	public void reviewsInsert(ReviewsVO vo);
	
	// 상품평 등록여부 체크
	public boolean chkReviews(String oid, String pid);
	
	public ReviewsDTO getReview(String oid, String ccolorcode);
	
	// 상품평 리스트 페이징처리
	public List<ReviewsDTO> getReviewListWithPaging(String pid, Criteria cri);
	
	public List<ReviewsDTO> getReviewList(@Param("pid") String pid);
	
	public ReviewsVO checkReviewWrite(@Param("mid") String mid, @Param("pid") String pid);
	
	//상품평의 개수를 확인
	public int UserReviewCount(String mid);
}
