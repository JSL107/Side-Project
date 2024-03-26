package com.hyundai.handsome.service;

import java.util.List;


import com.hyundai.handsome.vo.Criteria;
import com.hyundai.handsome.vo.ProductColorVO;
import com.hyundai.handsome.vo.ProductStockVO;
import com.hyundai.handsome.vo.ProductVO;

/* 
 * 작성자 : 김가희, 김나형
 * 
 * 상품과 관련한 SQL을 호출하기 위한 인터페이스
 */

public interface ProductService {
    //상품 상세보기
    public ProductVO productGetDetail(String pid, String ccolorcode);

    // 상품 색상 조회
    public List<ProductColorVO> productGetColor(String pid);

    // 상품 재고 조회
    public List<ProductStockVO> productGetStock(String pid, String ccolorcode);

    // 대, 중, 소 분류에 해당하는 상품 리스트 조회
    public List<ProductVO> getList(Criteria cri, String clarge, String cmedium, String csmall);

    // 대, 중, 소 분류에 해당하는 상품 총 개수 조회
    public int getTotal(String clarge, String cmedium, String csmall);

    //브랜드의 상품리스트 조회
    public List<ProductVO> getListBrand(Criteria cri, String bname);

    //브랜드별 상품 총 개수 조회
    public int getTotalBrand(String bname);

    //pid에 있는 상품사이즈 조회
    public List<String> getSize(String pid);
}

