package com.hdsm.domain;

import java.sql.Date;
import java.util.List;

import lombok.Data;


@Data
public class KakaoUserDTO {
    private String mid;
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
    private List<MemberAuthVO> authList;

}
