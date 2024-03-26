package com.hyundai.handsome.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hyundai.handsome.mapper.ProductMapper;
import com.hyundai.handsome.vo.Criteria;
import com.hyundai.handsome.vo.ProductColorVO;
import com.hyundai.handsome.vo.ProductStockVO;
import com.hyundai.handsome.vo.ProductVO;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

//작성자 : 김가희 , 김나형

@Service
@AllArgsConstructor
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductMapper mapper;

    // 상품 상세 조회
    @Override
    public ProductVO productGetDetail(String pid, String ccolorcode) {
        return mapper.productGetDetail(pid, ccolorcode);
    }

    // 상품 색상 조회
    @Override
    public List<ProductColorVO> productGetColor(String pid) {
        return mapper.productGetColor(pid);
    }

    // 상품 재고 조회
    @Override
    public List<ProductStockVO> productGetStock(String pid, String ccolorcode) {
        return mapper.productGetStock(pid, ccolorcode);
    }

    // 대, 중, 소 분류에 해당하는 상품 리스트 조회
    @Override
    public List<ProductVO> getList(Criteria cri, String clarge, String cmedium, String csmall) {
        return mapper.getListWithPaging(cri, clarge, cmedium, csmall);
    }

    // 상품 리스트의 마지막 페이지 구하기 위한 해당 카테고리 상품 총 개수 조회
    @Override
    public int getTotal(String clarge, String cmedium, String csmall) {
        return mapper.getTotal(clarge, cmedium, csmall);
    }

    // 브랜드별 상품 리스트 조회
    @Override
    public List<ProductVO> getListBrand(Criteria cri, String bname) {
        return mapper.getListWithPagingBrand(cri, bname);
    }

    // 상품 리스트의 마지막 페이지 구하기 위한 브랜드별 상품 총 개수 조회
    @Override
    public int getTotalBrand(String bname) {
        return mapper.getTotalBrand(bname);
    }

    //pid에 있는 상품사이즈 조회
    @Override
    public List<String> getSize(String pid) {
        return mapper.getSize(pid);
    }

}
