package com.hdsm.service;

import java.util.Map;

public interface PageCounterService {
	public int getCurrentIndex();
	
	public void ClosetCount(Map<String, Object> map);
	
	public int makeupCurrentIndex();
	
	public void MakeupCount(Map<String, Object> map);
	
	public void setViewCounter(String closet);
	
	public void csetCount03(); public void csetCount06(); public void csetCount09(); public void csetCount12();
	public void csetCount15(); public void csetCount18(); public void csetCount21(); public void csetCount24();
	
	public void mksetCount03(); public void mksetCount06(); public void mksetCount09(); public void mksetCount12();
	public void mksetCount15(); public void mksetCount18(); public void mksetCount21(); public void mksetCount24();
	
	public void ClosetCounterinsert();
	public void MakeupCounterinsert();
	public void EventCounterinsert();
}
