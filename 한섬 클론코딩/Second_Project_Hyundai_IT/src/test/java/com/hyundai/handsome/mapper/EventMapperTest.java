
package com.hyundai.handsome.mapper;

import com.hyundai.handsome.vo.EventVO;

import lombok.extern.log4j.Log4j;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
        "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
        "file:src/main/webapp/WEB-INF/spring/security-context.xml" })
@Log4j

public class EventMapperTest {
    
    
    @Autowired
    private EventMapper mapper;
      
    @Test
    public void getEventListTest() {
        mapper.getEventList();
    }
    
    @Test
    public void getEventListCriTest() {
        mapper.getEventList();
    }
}
