package com.hyundai.handsome.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * CouponVO
 *
 * @author 이준석
 * @since 10.06
 *
 *        <pre>
 * 수정일                 수정자                         수정내용
 * ----------  ---------------    --------------------------- 최초 생성
 * 2022.10.07	  이준석				최초생성
 * 2022.10.13	 김찬중				VO 수정
 *        </pre>
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class CouponVO {
    private String ccode; // 쿠폰 번호
    private int eid; // 이벤트 아이디
    private String mid; // 멤버아이디
    private String cname; // 쿠폰이름
    private Date cstartdate; // 쿠폰시작일자
    private Date cenddate; // 쿠폰 만료일
    private int cstate; // 사용가능 형태
}
