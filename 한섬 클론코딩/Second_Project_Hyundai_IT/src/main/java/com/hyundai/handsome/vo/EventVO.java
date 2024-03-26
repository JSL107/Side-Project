package com.hyundai.handsome.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/* 작성자 : 김찬중 이준석
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class EventVO {
    //    이벤트 아이디
    private int eid;
    //    이벤트 이름
    private String ename;
    //    이벤트 상세정보
    private String edetail;
    //    이벤트 시작 날짜
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date estartdate;
    //    이벤트 종료 날짜
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date eenddate;
    //    이벤트 이미지
    private String eimage;
    // 할인율
    private int eamount;
    // 최대 할인 금액
    private int elimit;
}
