package com.hyundai.handsome.vo;

import java.util.Date;

import lombok.Data;

//작성자 : 이준석
@Data
public class MyCouponListViewVO {
//    회원 번호
    private String mid;
//    쿠폰 코드
    private String ccode;
//    쿠폰 이름
    private String cname;
//    쿠폰 발급 날짜
    private Date cstartdate;
//    쿠폰 종료 날짜
    private Date cenddate;
//    쿠폰 상태
    private int cstate;
//    이벤트 이름
    private String ename;
//    할인율
    private int eamount;
}
