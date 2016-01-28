package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.dao.StudDao;
import com.vo.Student;


@WebServlet("/StudentController")
public class StudentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	    String id=request.getParameter("id");
		String firstname=request.getParameter("firstname");
		String lastname=request.getParameter("lastname");
		String phone=request.getParameter("phone");
		String email=request.getParameter("email");
		String attendance=request.getParameter("attendance");
		String photo=request.getParameter("upload");
		String insert=request.getParameter("insert");
	   
		
		
			StudDao sd = new StudDao();
			List<Student> list = sd.select();
			request.setAttribute("List", list);

			if (ServletFileUpload.isMultipartContent(request)) {
	         //   System.out.println("file Uploading");
				
	            RequestDispatcher rd = request.getRequestDispatcher("/StudentUpload");
				rd.forward(request, response);
			}

			if (insert != null && insert != "") {
				sd.insert(firstname, lastname, email, attendance, photo, phone,Integer.parseInt("enroll"));
				list = sd.select();
				request.setAttribute("List", list);
			
			    response.sendRedirect("/user/Student");
		}
		   	  
		   	if(request.getParameter("delete")!=null && request.getParameter("delete")!="" && request.getParameter("delete").equals("trash")){
		   		sd.delete(Integer.parseInt(id));
		   		list= sd.select();
		   	    request.setAttribute("List", list);
		   	    
		   	    response.sendRedirect("/user/Student");
		   	}
		
		}
	}


