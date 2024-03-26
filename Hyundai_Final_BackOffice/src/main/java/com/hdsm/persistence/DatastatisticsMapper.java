package com.hdsm.persistence;

import java.util.List;

import com.hdsm.domain.datastatistics.ClosetDTO;
import com.hdsm.domain.datastatistics.EventDTO;
import com.hdsm.domain.datastatistics.MakeupDTO;

public interface DatastatisticsMapper {
	
	public ClosetDTO getCloset();
	
	public MakeupDTO getMakeup();
	
	public List<EventDTO> getEventCount();
}
