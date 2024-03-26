package com.hdsm.domain.member;

import java.sql.Date;
import java.util.List;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import lombok.Data;

@Data
public class MemberDTO {
    private String mid;
    private String mpassword;
    private String mname;
    private String memail;
    private String mtel;
    private int mzipcode;
    private int buysum;
    private String maddress1;
    private String maddress2;
    private String mgrade;
    private Date mdate;
    private int mpoint;
    private int menabled;
    private String gender;
    private String age;
    private List<MemberAuthVO> authList;

    public String encode(String str) {
        BCryptPasswordEncoder pec = new BCryptPasswordEncoder();
        return pec.encode(str);
    }
}
