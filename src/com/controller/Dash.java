package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.boot.internal.SessionFactoryOptionsState;

import com.dao.StudDao;
import com.vo.Student;


@WebServlet("/Student/Dash")
public class Dash extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Dash() {
    }

    
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
 
    StudDao sd= new StudDao();
    List<Student> stud =sd.getStudentName();
    StringBuilder builder= new StringBuilder();
        
	for (Student student : stud) {
	builder.append("['");
	builder.append(student.getFirstname());
	builder.append("',");
	builder.append(student.getAttendance());
	builder.append("],");
		
	}
		request.setAttribute("Students", builder.toString());
		RequestDispatcher rd = request.getRequestDispatcher("/Student/home");
		rd.forward(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
