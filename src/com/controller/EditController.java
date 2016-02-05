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
import com.vo.Classroom;

@WebServlet("/EditController")
public class EditController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EditController() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		String name = request.getParameter("name2");
		String year = request.getParameter("year2");
		String submit = request.getParameter("submit");

		ClassDao cd = new ClassDao();
		Classroom cr = new Classroom();

		
//	System.out.println("-" + id + "-");
		

		if (submit != null && submit.equals("operation")) {
			cr = cd.update(name, year, Integer.parseInt(id));
          
			List<Classroom> list = cd.select();
	    	request.setAttribute("List", list);
	    	
	    	response.sendRedirect("user/home");
	    	
		}
		else{	
		cr = cd.getById(Integer.parseInt(id));
		response.getWriter().write(cr.getName() + ',' + cr.getYear());
		}
		
        
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	doGet(request, response);
	}

}
