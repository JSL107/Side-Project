
package com.hdsm.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hdsm.domain.Criteria;
import com.hdsm.domain.ReviewsDTO;
import com.hdsm.domain.ReviewsVO;


public interface ReviewsMapper {
		
	// 상퓸평 등록
	public void reviewsInsert(ReviewsVO vo);
	
	//상품평 작성 여부 확인
	public int chkReviews(@Param("oid") String oid, @Param("pid") String pid);
	
	public ReviewsDTO getReview(@Param("oid") String oid, @Param("ccolorcode") String ccolorcode);
	
	public List<ReviewsDTO> getReviewListWithPaging(
			@Param("pid") String pid, 
			@Param("cri") Criteria cri
			);
	
	// 상품평 리스트
	public List<ReviewsDTO> getReviewList(@Param("pid") String pid);
	
	public ReviewsVO checkReviewWrite(@Param("mid") String mid, @Param("pid") String pid);
	
	//한 회원의 리뷰 갯수를 가져옴
	public int UserReviewCount(String mid);

}
