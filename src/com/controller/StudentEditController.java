package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.StudDao;
import com.vo.Student;
@WebServlet("/StudentEditController")
public class StudentEditController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public StudentEditController() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

    String id=request.getParameter("id");
    String update= request.getParameter("update_data_operation");


		Student std = new Student();
		StudDao sd = new StudDao();
		
		if(update!=null && update!=""){
			
			
			std=sd.update(Integer.parseInt(id), request.getParameter("firstname2"),request.getParameter("lastname2"),request.getParameter("email2"),request.getParameter("att2"),request.getParameter("phone2"));
		    List list=  sd.select();
		    request.setAttribute("List", list);
	    
		 	response.sendRedirect("/user/Student");
		    
			
		}else{
		
		
        std=sd.getId(Integer.parseInt(id));
        response.getWriter().write(std.getFirstname()+','+std.getLastname()+','+std.getPhone()+','+std.getAttendance()+','+std.getEmail());
        
					}
	}
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
