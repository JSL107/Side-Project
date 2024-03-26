package com.hdsm.hyundai_final_raffle.persistence;

import com.hdsm.hyundai_final_raffle.mapper.RaffleMapper;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
public class RaffleMapperTests {

    @Autowired
    private RaffleMapper raffleMapper;

    @Test
    public void testGetRaffle() {
        log.info("Raffle test : " + raffleMapper.getRaffle());
    }

    @Test
    public void testGetRaffleDetails() {
        log.info("Raffle Details Test : " + raffleMapper.getRaffleDetails());
    }

    @Test
    public void testGetMember() {
        log.info("member : " + raffleMapper.getMemberInfo("ddww22"));
    }
}
