package com.hdsm.service.datastatistics;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hdsm.domain.datastatistics.ClosetDTO;
import com.hdsm.domain.datastatistics.EventDTO;
import com.hdsm.domain.datastatistics.MakeupDTO;
import com.hdsm.persistence.DatastatisticsMapper;

@Service
public class DatastatisticsServiceImpl implements DatastatisticsService{
	@Autowired
	DatastatisticsMapper datamapper;
	
	@Override
	public ClosetDTO getClosetCount() {
		
		return datamapper.getCloset();
		
	}

	@Override
	public MakeupDTO getMakeupCount() {
		
		return datamapper.getMakeup();
		
	}

	@Override
	public List<EventDTO> EventCount() {
		List<EventDTO> event = datamapper.getEventCount();
		return event;
	}

}
