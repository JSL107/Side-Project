package com.hdsm.session;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.hdsm.service.PageCounterService;
import com.hdsm.service.PageCounterServiceImpl;

@Component
public final class MySessionListner implements HttpSessionListener{
	
	public MySessionListner() {}
	
	@Override
	public void sessionCreated(HttpSessionEvent sessionEvent) {		
		HttpSession session = sessionEvent.getSession();		
		try {
			System.out.println("세션 생성 : "+session);			
		}catch(Exception e) {
			System.out.println("Error setting session attribute: "+e.getMessage());
		}
	}
		
	public void sessionDestroyed(HttpSessionEvent sessionEvent) {
		HttpSession session = sessionEvent.getSession();
		final WebApplicationContext springContext = WebApplicationContextUtils.getWebApplicationContext(session.getServletContext());
		final PageCounterServiceImpl props = (PageCounterServiceImpl)springContext.getBean("pageCounterServiceImpl");
		String closet = (String) session.getAttribute("closet");
		if(closet!=null) {
			props.setViewCounter(closet);
		}

	}
}