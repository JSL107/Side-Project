
package com.hdsm.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hdsm.domain.Criteria;
import com.hdsm.domain.ReviewDTO;


public interface ReviewMapper {
		
	// 상퓸평 등록
	public void reviewInsert(ReviewDTO dto);
	
	// 상품평 리스트
	public List<ReviewDTO> getReviewList(@Param("pid") String pid);
	
	// 상품평 리스트
	public List<ReviewDTO> getReviewListWithPaging(
			@Param("pid") String pid, 
			@Param("cri") Criteria cri
			);
	
	// 상품평 작성 여부 확인
	public int getReviewCount(
						@Param("pid") String pid, 
						@Param("mid") String mid, 
						@Param("pcolor") String pcolor,
						@Param("psize") String psize
						);
	

	//한 회원의 리뷰 갯수를 가져오기
	public int UserReviewCount(String mid);


	// 상품평 멤버 조회
	public List<ReviewDTO> getReviewMemberList(
			@Param("pid") String pid, 
			@Param("mid") String mid
			);
	
	public int chkReviews(@Param("oid") String oid); 
}
