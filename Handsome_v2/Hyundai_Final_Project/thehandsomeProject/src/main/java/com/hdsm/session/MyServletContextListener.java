package com.hdsm.session;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class MyServletContextListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent event) {
        // TODO Auto-generated method stub
        ServletContext sc = event.getServletContext();
        System.out.println("----------------------------------------------");
        System.out.println(sc+"applicaiton리스너 시작");
    }
    
    @Override
    public void contextDestroyed(ServletContextEvent event) {
        // TODO Auto-generated method stub
    	ServletContext sc = event.getServletContext();
        System.out.println("----------------------------------------------");       
        System.out.println(sc+"applicaiton리스너 종료");
    }
}