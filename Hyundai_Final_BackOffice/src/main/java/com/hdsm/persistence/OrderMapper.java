package com.hdsm.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import com.hdsm.domain.order.OrderUserVO;

public interface OrderMapper {

	public List<OrderUserVO> getOrderList();
	
	public void paymentCancle(String imp_uid);
	
	public void changeStatus(@Param("oid")String oid, @Param("ostatus")int ostatus);
	
	public List<Map<String, Object>> orderStatus();
}
