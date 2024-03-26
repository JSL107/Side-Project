package com.hdsm.session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.hdsm.service.PageCounterService;

@Component
public class MyScheduler {		
		@Autowired
		PageCounterService service;
		
		@Scheduled(cron="0 57 23 1/1 * ?")
		public void setCount00() throws Exception{
			service.csetCount24();
			service.mksetCount24();
			
			service.ClosetCounterinsert();
			service.MakeupCounterinsert();
			service.EventCounterinsert();
		}
		@Scheduled(cron="0 0 3 1/1 * ?")
		public void setCount03() throws Exception{
			service.csetCount03();
			service.mksetCount03();
		}
		
		@Scheduled(cron="0 0 6 1/1 * ?")
		public void setCount06() throws Exception{
			service.csetCount06();
			service.mksetCount06();
		}
		@Scheduled(cron="0 0 9 1/1 * ?")
		public void setCount09() throws Exception{
			service.csetCount09();
			service.mksetCount09();
		}
		@Scheduled(cron="0 0 12 1/1 * ?")
		public void setCount12() throws Exception{
			service.csetCount12();
			service.mksetCount12();
		}
		@Scheduled(cron="0 0 15 1/1 * ?")
		public void setCount15() throws Exception{
			service.csetCount15();
			service.mksetCount15();
		}
		@Scheduled(cron="0 0 18 1/1 * ?")
		public void setCount18() throws Exception{
			service.csetCount18();
			service.mksetCount18();
		}
		@Scheduled(cron="0 0 21 1/1 * ?")
		public void setCount21() throws Exception{
			service.csetCount21();
			service.mksetCount21();
		}
}
