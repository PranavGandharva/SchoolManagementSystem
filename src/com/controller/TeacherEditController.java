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
@WebServlet("/TeacherEditController")
public class TeacherEditController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public TeacherEditController() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String id=	request.getParameter("id");
    String update=request.getParameter("update_data_operation");
    String firstname=request.getParameter("firstname2");
    String lastname=request.getParameter("lastname2");
    String email= request.getParameter("email2");
    String phonenumber=request.getParameter("phone2");
    
    
    TeachDao td= new TeachDao();
	Teacher tech = new Teacher();	
		if (update != null && update != "") {
			tech = td.update(Integer.parseInt(id), firstname, lastname, email, phonenumber);
			List<Teacher> list = td.select();

			request.setAttribute("List", list);
			RequestDispatcher rd = request.getRequestDispatcher("pages/teacherform.jsp");
			rd.forward(request, response);

		}else{
		    tech=td.getById(Integer.parseInt(id));
		 	response.getWriter().write(tech.getFirstname()+','+tech.getLastname()+','+tech.getEmail()+','+tech.getPhonenumber());	
		}
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
