package com.hdsm.domain;

import java.util.Date;

import lombok.Data;


@Data
public class EventDTO {
    private int eid;
    private String ename;
    private String edetail;
    private Date estartdate;
    private Date eenddate;
    private String eimage;
    private int eamount;
    private int elimit;
}
