package com.hdsm.controller;

import org.json.JSONObject;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.extern.log4j.Log4j;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
	"file:src/main/webapp/WEB-INF/spring/root-context.xml"
	})
@Log4j
public class OrderControllerTest {

	@Autowired
	private WebApplicationContext ctx;
	protected MockHttpSession session;
	private MockMvc mockMvc;

	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();		
		session=new MockHttpSession();
		session.setAttribute("member", "minchan");
	}

	//주문 페이지로 이동하는 테스트
	@Test
	public void TestorderPage() throws Exception{

		  log.info( mockMvc.perform( 
		   MockMvcRequestBuilders.post("/order/order_page")
		  .session(session)
		  .param("orders[0].pid", "TH2C1KRN009M") 
		  .param("orders[0].oamount","2")
		  .param("orders[0].ccolorcode","TH2C1KRN002M_AD")
		  .param("orders[0].ssize","100")
		  )
				  .andReturn()
				  .getModelAndView()
				  .getModelMap()
		   ); 
	}
	
	//주문을 수행하는 테스트
	@Test
	public void TestOrderexec()throws Exception{
		
		JSONObject actual = new JSONObject();
		actual.put("oid", "minchan_20221027");
		actual.put("mid", "minchan");
		 log.info( mockMvc.perform( 
				   MockMvcRequestBuilders.post("/order/orderexec")
				  .session(session)
				  .param("orders[0].pid", "TH2C1KRN009M") 
				  .param("orders[0].oamount","2")
				  .param("orders[0].ccolorcode","TH2C1KRN002M_AD")
				  .param("orders[0].ssize","100")
				  )
						  .andReturn()
						  .getModelAndView()
						  .getModelMap()
				   ); 
		
	}

}
