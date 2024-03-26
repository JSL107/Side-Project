package com.hdsm.service;

import java.util.List;

import com.hdsm.domain.EventDTO;


public interface EventService {
    List<EventDTO> getEventList() throws Exception;

    public EventDTO getEventDetail(Integer eid) throws Exception;

    public Integer getEventNumber(String ccode) throws Exception;
}
