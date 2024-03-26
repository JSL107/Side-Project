package com.hdsm.persistence;

import java.util.List;

import com.hdsm.domain.EventDTO;

public interface EventMapper {
    public List<EventDTO> getEventList();

    public EventDTO getEventDetail(Integer eid);

    public Integer getEventNumber(String ccode);

}
