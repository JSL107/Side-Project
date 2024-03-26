package com.hdsm.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hdsm.domain.ChatbotStyleVO;
import com.hdsm.domain.Criteria;
import com.hdsm.domain.FilterDTO;
import com.hdsm.domain.ProductColorVO;
import com.hdsm.domain.ProductVO;
import com.hdsm.domain.ThumbnailColorVO;
import com.hdsm.domain.ThumbnailVO;

public interface ProductService {
	
	public List<ProductVO> getList(ProductVO product);

	//카테고리물건을 페이징해서 물건목록 가져오기
	//여기서 Param은 xml로 인자를 2개이상 줄때는 class 속성값 이름만 줘서는 못 알아 먹어서 cri.amount 이런식으로 쓰기위해 @Param을 씀
	public List<ThumbnailVO> getProductThumbnailListWithPaging(ProductVO vo, Criteria cri, FilterDTO fd);
	
	public List<ThumbnailVO> getSearchThumbnailList(@Param("words") String words, @Param("cri") Criteria cri,
			@Param("fd") FilterDTO fd);
	
	public int productCount(ProductVO vo);
	
	// 필터된 물건 갯수
	public int productFiltedCount(@Param("vo") ProductVO vo, @Param("fd") FilterDTO fd);
	
	//검색된 물건 갯수
	public int productSearchedCount(@Param("words") String words);

	//검색된 물건 갯수
	public int productSearchedFilteredCount(@Param("words") String words, @Param("fd") FilterDTO fd);

	// 스마트옷장
	// 스타일로
	public List<ThumbnailVO> getSearchThumbnailListStyle(@Param("style") String style, @Param("cri") Criteria cri,
													@Param("fd") FilterDTO fd);

	// 스타일로 검색된 물건 개수
	public int styleSearchedCount(@Param("style") String style);

	// 스타일로 물건 갯수
	public int styleSearchedFilteredCount(@Param("style") String style, @Param("fd") FilterDTO fd);

	
	public ProductVO getProduct(String pid);
	
	public List<ProductColorVO> getProductColor(String pid);
	
	public List<ChatbotStyleVO> getRandomStyleList(String style);
	
	
}
