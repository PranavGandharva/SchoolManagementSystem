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
import com.dao.GetSession;
import com.vo.Classroom;

@WebServlet("/ClassroomController")
public class ClassroomController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ClassroomController() {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
	
	String id=request.getParameter("id");	
    String add=	request.getParameter("add");	
	String name=request.getParameter("name");
    String year=request.getParameter("year");
	String edit=request.getParameter("edit");
    String delete= request.getParameter("delete");
	
    ClassDao cd = new ClassDao();
    Classroom cr = new Classroom();
	
   List<Classroom>  list= cd.select();
    request.setAttribute("List", list);
   
    if(request.getAttribute("opToPerform")!=null && request.getAttribute("opToPerform").equals("check_bef_add_class")) {
    	if(cd.valid(name, year)){
    
    		response.getWriter().write("valid");
    	
    	   	}
    	else{
    		response.getWriter().write("not valid");
    	
    	}
    	   	
    }
        
    if(add!=null && add!=""){
    	
    	cd.insert(name, year);
    	list = cd.select();
    	request.setAttribute("List", list);
    	
    	response.sendRedirect("/user/home");
    	
//    	RequestDispatcher rd = request.getRequestDispatcher("/home");
//    	rd.forward(request, response);
    	
    }
    
    
    
   if(delete!=null && delete.equals("trash")){
	
            cd.delete(Integer.parseInt(id));
			
		    list = cd.select();
	    	request.setAttribute("List", list);
	    				
			response.sendRedirect("/user/home");
	    	
	}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
