package com.tohome.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//Written  by 미림
public interface Action {
 public void execute(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException;
}
