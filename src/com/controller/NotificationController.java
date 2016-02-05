package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.hibernate.Session;

import com.dao.StudDao;
import com.vo.User;

@WebServlet("/teacher/NotificationController")
public class NotificationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public NotificationController() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
    
	
	String remark=request.getParameter("remark");
    String submit= request.getParameter("submit_but");
	String str= request.getParameter("str"); 	
	String Id=request.getParameter("id");	
	String operation=request.getParameter("operation");
		HttpSession session= request.getSession();
	
		if (operation.equals("fetchStudentForClass")) {
			StudDao sd = new StudDao();

			ObjectMapper om = new ObjectMapper();
			om.writer().writeValue(response.getOutputStream(), sd.jsonData(Integer.parseInt(Id)));

		} else if (submit != null && submit != "") {
			String str1[] = str.split(",");
		System.out.println("userId:"+session.getAttribute("user"));
			
         
			}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
