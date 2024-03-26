package com.hdsm.service.order;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.hdsm.domain.order.Criteria;
import com.hdsm.domain.order.OrderUserVO;

public interface OrderService {
	
	public List<OrderUserVO> getList();
	
	public void StatusChangeOrderUser(@Param("oid")String oid, @Param("ostatus")int ostatus);
	
	public void paymentCancleOrder(String imp_uid);
	
	public List<Map<String, Object>> getOrderStatus();
}
