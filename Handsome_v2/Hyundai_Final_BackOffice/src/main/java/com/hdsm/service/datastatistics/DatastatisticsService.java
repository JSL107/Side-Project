package com.hdsm.service.datastatistics;

import java.util.List;

import com.hdsm.domain.datastatistics.ClosetDTO;
import com.hdsm.domain.datastatistics.EventDTO;
import com.hdsm.domain.datastatistics.MakeupDTO;

public interface DatastatisticsService {
	
	public ClosetDTO getClosetCount();
	
	public MakeupDTO getMakeupCount();
	
	public List<EventDTO> EventCount();
}
