package com.hyundai.handsome.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hyundai.handsome.mapper.ChartMapper;
import com.hyundai.handsome.vo.ChartVO;

/**
 * MemberMepper
 *
 * @author 김찬중, 이준석
 * @since 10.06
 *
 *        <pre>
 * 수정일                 수정자                         수정내용
 * ----------  ---------------    ---------------------------
 * 2022.10.05	  이준석			최초 생성
 * 2022.10.07	  김찬중			로그인 서비스 구현
 *        </pre>
 */
@Service
public class ChartServiceImpl implements ChartService {

    @Autowired
    ChartMapper chartMapper;

    //    성별, 잡화 별 차트 표시
    @Override
    public ChartVO showSex(ChartVO chart){
        chartMapper.showSex(chart);
        return chartMapper.showSex(chart);
    }

    //    브랜드 별 차트 표시
    @Override
    public ChartVO showBno(ChartVO chart) {
        chartMapper.showBno(chart);
        return chartMapper.showBno(chart);
    }
    
}
