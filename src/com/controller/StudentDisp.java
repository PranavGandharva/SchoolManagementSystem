package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.ClassDao;
import com.dao.StudDao;
import com.vo.Classroom;
import com.vo.Student;

@WebServlet("/StudentDisp")
public class StudentDisp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public StudentDisp() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	String str=	request.getRequestURI().replace(request.getContextPath(),"");
	
	
System.out.println("REQ" + request.getRequestURL() + " STR: " + str);
	
				
		if (str.equals("/addUser")) {
			System.out.println("heerer");
			RequestDispatcher rd = request.getRequestDispatcher("/UserManagementController");
			rd.forward(request, response);
		}				 
				 
		else if(str.equals("/login")){
    RequestDispatcher rd=request.getRequestDispatcher("pages/login.jsp");
    rd.forward(request, response);
		
	}
				 
	
		else if(str.equals("/user/Student")){
		StudDao sd= new StudDao();
	    List<Student> list=	sd.select();
		request.setAttribute("List",list);
		
	RequestDispatcher rd=    request.getRequestDispatcher("/pages/strudentform.jsp");
	rd.forward(request, response);	
				
	}
	  
	   
		else if(str.equals("/EditStudents")){
		
		RequestDispatcher rd=request.getRequestDispatcher("/StudentEditController");
		rd.forward(request, response);	
			
		} 
		
		else if(str.equals("/user/home")){
			
			ClassDao cd= new ClassDao();
			List<Classroom> list=cd.select();
			request.setAttribute("List",list);
			
			RequestDispatcher rd= request.getRequestDispatcher("/pages/form.jsp");
			rd.forward(request, response);
		}
	
	}	
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String str=	request.getRequestURI().replace(request.getContextPath(),"");
			if(str.equals("/AddStudents")){
				
				RequestDispatcher rd=request.getRequestDispatcher("/StudentController");
				rd.forward(request, response);	
					
				}
	}

}
