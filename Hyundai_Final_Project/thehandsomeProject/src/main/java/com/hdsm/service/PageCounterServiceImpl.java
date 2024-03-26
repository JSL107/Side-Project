package com.hdsm.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hdsm.persistence.PageCounterMapper;

@Service
public class PageCounterServiceImpl implements PageCounterService{
	@Autowired
	PageCounterMapper pagemapper;
	@Override
	public int getCurrentIndex() {
		return pagemapper.getclosetindex();
	}
	@Override
	public void ClosetCount(Map<String, Object> map) {
		pagemapper.updateClosetCounter(map);
	}
	@Override
	public int makeupCurrentIndex() {
		return pagemapper.getmakeupindex();
	}
	@Override
	public void MakeupCount(Map<String, Object> map) {
		pagemapper.updateMakeupCounter(map);
		
	}
	@Override
	public void setViewCounter(String closet) {
		pagemapper.updateViewCounter(closet);	
	}
	
	@Override
	public void csetCount03() {
		pagemapper.setCount03();
		
	}
	@Override
	public void csetCount06() {
		// TODO Auto-generated method stub
		pagemapper.setCount06();
	}
	@Override
	public void csetCount09() {
		// TODO Auto-generated method stub
		pagemapper.setCount09();
	}
	@Override
	public void csetCount12() {
		// TODO Auto-generated method stub
		pagemapper.setCount12();
	}
	@Override
	public void csetCount15() {
		// TODO Auto-generated method stub
		pagemapper.setCount15();
	}
	@Override
	public void csetCount18() {
		// TODO Auto-generated method stub
		pagemapper.setCount18();
	}
	@Override
	public void csetCount21() {
		// TODO Auto-generated method stub
		pagemapper.setCount21();
	}
	@Override
	public void csetCount24() {
		// TODO Auto-generated method stub
		pagemapper.setCount24();
	}
	@Override
	public void mksetCount03() {
		// TODO Auto-generated method stub
		pagemapper.msetCount03();
	}
	@Override
	public void mksetCount06() {
		// TODO Auto-generated method stub
		pagemapper.msetCount06();
	}
	@Override
	public void mksetCount09() {
		// TODO Auto-generated method stub
		pagemapper.msetCount09();
	}
	@Override
	public void mksetCount12() {
		// TODO Auto-generated method stub
		pagemapper.msetCount12();
	}
	@Override
	public void mksetCount15() {
		// TODO Auto-generated method stub
		pagemapper.msetCount15();
	}
	@Override
	public void mksetCount18() {
		// TODO Auto-generated method stub
		pagemapper.msetCount18();
	}
	@Override
	public void mksetCount21() {
		// TODO Auto-generated method stub
		pagemapper.msetCount21();
	}
	@Override
	public void mksetCount24() {
		// TODO Auto-generated method stub
		pagemapper.msetCount24();
	}
	@Override
	public void ClosetCounterinsert() {
		// TODO Auto-generated method stub
		pagemapper.insertClosetCounter();
	}
	@Override
	public void MakeupCounterinsert() {
		// TODO Auto-generated method stub
		pagemapper.insertMakeupCounter();
	}
	@Override
	public void EventCounterinsert() {
		// TODO Auto-generated method stub
		pagemapper.insertEventCounter();
	}

}
