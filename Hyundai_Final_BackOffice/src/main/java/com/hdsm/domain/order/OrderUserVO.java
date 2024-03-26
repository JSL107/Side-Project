package com.hdsm.domain.order;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class OrderUserVO {
	private String oid;
	private String mid;
	private int ozipcode;
	private String oaddress1;
	private String oaddress2;
	private Date odate;
	private String oreceiver;
	private String otel;
	private String ocal;
	private String omessage;
	private int ousermilege;
	private int ousedcoupon;
	private String ousedcoupondetail;
	private int opayment;
	private int ostatus;
	private String oaccountdeadline;
	private int odiscounted;
	private String strpayment;
	private String tocart;
	private String imp_uid;
	private String ccode;
	
	List<OrderItemVO> orders;
}
