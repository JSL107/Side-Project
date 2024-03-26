package com.hdsm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hdsm.domain.EventDTO;
import com.hdsm.persistence.EventMapper;


@Service
public class EventServiceImpl implements EventService {
    @Autowired
    EventMapper eventMapper;


    @Override
    public List<EventDTO> getEventList() throws Exception {
        return eventMapper.getEventList();
    }

    @Override
    public EventDTO getEventDetail(Integer eid) throws Exception {
        return eventMapper.getEventDetail(eid);
    }

    @Override
    public Integer getEventNumber(String ccode) throws Exception {
        return eventMapper.getEventNumber(ccode);
    }
}
