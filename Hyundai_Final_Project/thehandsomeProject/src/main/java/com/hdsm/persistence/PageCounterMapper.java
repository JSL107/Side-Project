package com.hdsm.persistence;

import java.util.Map;

public interface PageCounterMapper {
	//스마트 옷장
	public int getclosetindex();
	
	public void updateClosetCounter(Map<String, Object> map);
	//메이크업
	public int getmakeupindex();
	
	public void updateMakeupCounter(Map<String, Object> map);
	
	public void updateViewCounter(String closet);
	
	//3시간 마다
	public void setCount03(); public void setCount06(); public void setCount09(); public void setCount12();
	public void setCount15(); public void setCount18(); public void setCount21(); public void setCount24();
	//3시간 마다
	public void msetCount03(); public void msetCount06(); public void msetCount09(); public void msetCount12();
	public void msetCount15(); public void msetCount18(); public void msetCount21(); public void msetCount24();
	
	//24시마다
	public void insertClosetCounter();
	public void insertMakeupCounter();
	public void insertEventCounter();
	
}
