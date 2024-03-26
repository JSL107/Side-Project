package com.hyundai.handsome.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hyundai.handsome.vo.Criteria;
import com.hyundai.handsome.vo.ProductColorVO;
import com.hyundai.handsome.vo.ProductStockVO;
import com.hyundai.handsome.vo.ProductVO;

/* 
 * 작성자 : 김가희, 김나형
 * 
 * 상품과 관련한 SQL을 호출하기 위한 인터페이스
 */
public interface ProductMapper {

    //특정한 색상의 상품의 세부정보 조회
	public ProductVO productGetDetail(@Param("pid")String pid, @Param("ccolorcode")String ccolorcode);

	//한 상품 컬러리스트 조회
    public List<ProductColorVO> productGetColor(String pid);

    //한 상품 재고,사이즈정보 조회
    public List<ProductStockVO> productGetStock(@Param("pid")String pid, @Param("ccolorcode")String ccolorcode); // 상품 사이즈 리스트

     // 카테고리별 상품리스트
    public List<ProductVO> getListWithPaging(Criteria cri, @Param("clarge")String clarge, @Param("cmedium")String cmedium, @Param("csmall")String csmall); 

    // 브랜드별 상품리스트
    public List<ProductVO> getListWithPagingBrand(Criteria cri, @Param("bname")String bname); 
        
    // 카테고리별 총 상품 개수
    public int getTotal(@Param("clarge")String clarge, @Param("cmedium")String cmedium, @Param("csmall")String csmall);
    
    // 브랜드별 총 상품 개수
    public int getTotalBrand(@Param("bname")String bname);
    
    // 해당 pid의 사이즈 순서별로 가져오기
    public List<String> getSize(@Param("pid")String pid);
    
}
