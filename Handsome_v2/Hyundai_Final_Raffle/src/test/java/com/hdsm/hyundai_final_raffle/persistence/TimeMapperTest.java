package com.hdsm.hyundai_final_raffle.persistence;

import com.hdsm.hyundai_final_raffle.mapper.TimeMapper;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
public class TimeMapperTest {
    @Autowired
    private TimeMapper timeMapper;

    @Test
    public void testGetTime() {
        log.info("timeMapper class name : " + timeMapper.getClass());
        log.info("timeMapper time : " + timeMapper.getTime());

    }
}
