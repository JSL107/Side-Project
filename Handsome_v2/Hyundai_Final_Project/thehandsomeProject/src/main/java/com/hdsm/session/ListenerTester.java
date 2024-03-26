package com.hdsm.session;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ListenerTester extends HttpServlet {
	String closet;
    public void doGet(HttpServletRequest request, HttpServletResponse response)
                    throws IOException, ServletException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        out.println("test context attribute set by listener<br>");
        out.println("<br>");
        
        closet = (String)getServletContext().getAttribute("closet");
        out.println("옷장 진입 수 : " + closet);
    }
    public String getCloset() {
    	return closet;    	
    }
    public void setCloset(String s) {
    	this.closet=s;    	
    }
}