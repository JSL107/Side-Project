package com.hdsm.controller;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public final class MySessionListner implements HttpSessionListener{
	public MySessionListner() {}

	@Override
	public void sessionCreated(HttpSessionEvent sessionEvent) {
		
		HttpSession session = sessionEvent.getSession();
		
		try {
			System.out.println("세션 생성 : "+session);
			session.setAttribute("count", "1");
		}catch(Exception e) {
			System.out.println("Error setting session attribute: "+e.getMessage());
		}
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent sessionEvent) {
		HttpSession session = sessionEvent.getSession();
		
		System.out.println("세션 invaild:"+session);
		System.out.println("value of count is :"+session.getAttribute("count"));
	}
	
	
}
