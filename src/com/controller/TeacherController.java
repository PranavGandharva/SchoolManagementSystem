package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.TeachDao;
import com.vo.Teacher;

@WebServlet("/Teacher")
public class TeacherController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public TeacherController() {
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
	
	String id = request.getParameter("id");	
	String insert=request.getParameter("insert");
	String firstname=	request.getParameter("firstname");
	String lastname=request.getParameter("lastname");	
	String phonenumber=request.getParameter("phonenumber");
	String email=request.getParameter("email");
    String delete= request.getParameter("delete");
    
		TeachDao td = new TeachDao();
	
		if(insert!= null && insert !=""){
		
		td.insert(firstname, lastname, email, phonenumber);

		List<Teacher> list = td.select();
		request.setAttribute("List", list);

		RequestDispatcher rd = request.getRequestDispatcher("pages/teacherform.jsp");
		rd.forward(request, response);
		}
	if(delete!=null && delete !=""){
		td.delete(Integer.parseInt(id));
	    List<Teacher> list = td.select();
		request.setAttribute("List", list);

     	RequestDispatcher	rd = request.getRequestDispatcher("pages/teacherform.jsp");
		rd.forward(request, response);
				
		
	}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
