package com.controller;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.vo.User;

public class Demo implements Filter {

    public Demo() {
    }

	public void destroy() {
	System.out.println("filter destroy");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
        HttpServletRequest req=(HttpServletRequest)request;
		HttpServletResponse res= (HttpServletResponse)response;
		HttpSession session = req.getSession();
		Object context = session.getAttribute("user");
		if(req.getRequestURI().contains("/bower_components")||req.getRequestURI().contains("/dist")||req.getRequestURI().contains("/js")||req.getRequestURI().contains("/less")){
			chain.doFilter(request, response);		
		return;
		}
		
		if(req.getRequestURI().endsWith("/login")||req.getRequestURI().contains("/LoginController")){
			chain.doFilter(request, response);
			return;
		}if(context == null) {
			res.sendError(403,"you cant log in");
			return;
		}
		System.out.println("Context: " + context);
		User user = (User) context;
				
		
		System.out.println("do filter"+req.getRequestURI());
		if(req.getRequestURI().contains("/Student/")||req.getRequestURI().contains("/AddStudents")) {
			if(user.getUsertype() == 1)
				chain.doFilter(request, response);
			
			else
				res.sendError(403, "You are not authorized to view this page");
		} else if(req.getRequestURI().contains("/teacher/")||req.getRequestURI().contains("/AddTeacher")||req.getRequestURI().contains("/TeacherEditController")||req.getRequestURI().contains("/StudentDisp")){
			if(user.getUsertype()==0)
				chain.doFilter(request, response);
			
			else
				res.sendError(403);
		}
		
	}
	
			
	@Override
	public void init(FilterConfig fConfig) throws ServletException {
	System.out.println("demo filter");
	
	}

}
