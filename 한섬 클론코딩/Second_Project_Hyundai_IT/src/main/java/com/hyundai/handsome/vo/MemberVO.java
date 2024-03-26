package com.hyundai.handsome.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * MemberVO
 * 
 * @author 김찬중, 이준석
 * @since 10.06
 * 
 *        <pre>
 * 수정일                 수정자                         수정내용
 * ----------  ---------------    ---------------------------
 * 2022.10.06    이준석                         최초 생성
 * 2022.10.13	 김찬중				VO 컬럼 추가
 *        </pre>
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class MemberVO {
    private String mid; // 회원 id
    private String mpassword; // 회원 pw
    private String mname; // 회원 이름
    private String memail; // 회원 이메일
    private String mtel; // 회원 전화번호
    private String maddress1; // 회원 주소
    private String maddress2; // 회원 상세주소
    private String maddress3; // 회원 상세주소
    private String mgrade; // 회원 등급
    private Date mdate; // 회원가입 날짜
    private String mpoint; // mpoint
    private int menabled; // 회원 상태

    @Override
    public String toString() {
        return "MemberVO [mid=" + mid + ", mpassword=" + mpassword + ", mname=" + mname + ", memail=" + memail
                + ", mtel=" + mtel + ", maddress1=" + maddress1 + ", maddress2=" + maddress2 + ", maddress3="
                + maddress3 + "]";
    }

}
