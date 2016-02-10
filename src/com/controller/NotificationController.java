package com.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.hibernate.Session;

import com.dao.NotiDao;
import com.dao.StudDao;
import com.vo.Notification;
import com.vo.Student;
import com.vo.Teacher;
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
	
		if (operation!=null && operation.equals("fetchStudentForClass")) {
			StudDao sd = new StudDao();

			ObjectMapper om = new ObjectMapper();
			om.writer().writeValue(response.getOutputStream(), sd.jsonData(Integer.parseInt(Id)));

		}  if (submit != null && submit != "") {
		System.out.println("hi");
		String str1[] =str.split(",");
        
		System.out.println("userId:"+session.getAttribute("user"));
		
		for (String string : str1) {
			    Notification nt = new Notification();
				NotiDao nd= new NotiDao();
				Student student = nd.getNotiByEnroll(Integer.parseInt(string));
			    	
			    
				System.out.println("NOTIFICATION:"+"  "+student.getNotification().add(nt));
                System.out.println("CLASS NAMe:"+"   "+student.getNotification().getClass());    
                System.out.println("ROW :"+"  "+student.getNotification().get(0));;
                System.out.println("SiZE:"+"   "+student.getNotification().size());;
                
                nt.setStudent(student);
                nt.setRemark(remark);
				nt.setDate(new Date());
			    nt.setRead(false);
			    nt.setUser((User)(session.getAttribute("user")));
			    nd.insert(nt,student);
			    
			   
			   
			}
         
			}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
