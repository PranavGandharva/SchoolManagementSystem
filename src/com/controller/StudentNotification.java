package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.NotiDao;
import com.dao.StudDao;
import com.vo.Notification;


@WebServlet("/StudentNotification")
public class StudentNotification extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public StudentNotification() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     String notify=	request.getParameter("StudentNotification");
       
     if(notify!=null && notify!=""){
			NotiDao dao = new NotiDao();
			
		List<Notification> list=	dao.select();
		for (Notification notification : list) {
			response.getWriter().write(notification.getRemark() + "," + notification.getDate()+",");
		
		}	
		
		
     }
     
     	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
