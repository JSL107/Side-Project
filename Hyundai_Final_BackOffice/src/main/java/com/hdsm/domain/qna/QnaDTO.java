package com.hdsm.domain.qna;

import java.sql.Date;
import lombok.Data;

@Data
public class QnaDTO {
	private long qno;//qna번호
	private String pid;
	private String mid;
	private String mname;
	private String qtitle;
	private String qcontent;
	private Date qdate;
	private String qstate;
	private	String qsecret;
	
	private String qemailsend;
	private String qsmssend;
	private String qphonenum;
	private String qemail;
	
	//관리자 답변
	private String qmanager;
	private String qreplycontent;
	private Date qreplydate;
}
