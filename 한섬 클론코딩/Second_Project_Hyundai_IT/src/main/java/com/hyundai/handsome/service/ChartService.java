package com.hyundai.handsome.service;

import com.hyundai.handsome.vo.ChartVO;

/**
 * MemberMepper
 *
 * @author 김찬중, 이준석
 * @since 10.06
 *
 * <pre>
 * 수정일                 수정자                         수정내용
 * ----------  ---------------    ---------------------------
 * 2022.10.05	  이준석			최초 생성, 리스트 테스트 코드 작성
 * 2022.10.07	  이준석			로그인 작성
 *        </pre>
 */
public interface ChartService {

    //    성별, 잡화 별 차트 표시
    public ChartVO showSex(ChartVO chart);

    //    브랜드 별 차트 표시
    public ChartVO showBno(ChartVO chart);

}
