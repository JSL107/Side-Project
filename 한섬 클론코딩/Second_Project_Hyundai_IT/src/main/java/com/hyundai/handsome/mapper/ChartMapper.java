package com.hyundai.handsome.mapper;

import com.hyundai.handsome.vo.ChartVO;

/**
 * ChartMapper
 * 
 * @author 김찬중
 * @since 10.06
 * 
 *        <pre>
 * 수정일                 수정자                         수정내용
 * ----------  ---------------    ---------------------------
 * 2022.10.06    김찬중                        최초 생성
 *        </pre>
 */

public interface ChartMapper {
//	성별 별 수량 비율 차트로 나타내주는 메소드
	public ChartVO showSex(ChartVO chart);
	
//	브랜드별 상품 수량 비율 차트로 나타내주는 메소드
	public ChartVO showBno(ChartVO chart);
}