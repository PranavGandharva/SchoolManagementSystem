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

@WebServlet("/DisplayController")
public class DisplayController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DisplayController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		System.out.println(request.getRequestURI());
//		System.out.println(request.getContextPath());
//		
		String str= request.getRequestURI().replace(request.getContextPath(),"");
//		if(str.startsWith("/bower_components") || str.startsWith("/dist")|| str.startsWith("/js")||str.startsWith("/less")){
//			
//			
//			RequestDispatcher rd= request.getRequestDispatcher("pages/form.jsp");
//			rd.forward(request, response);
//		
//		}
		System.out.println("String str:"+str);
		
		
		if(str.equals("/CheckValidClassroomAdd")){
			System.out.println("check valid classroom add");
			
			request.setAttribute("opToPerform", "check_bef_add_class" );
	        RequestDispatcher rd=request.getRequestDispatcher("/ClassroomController");
			rd.forward(request, response);
			
		}

		if(str.equals("/ClassroomAdd")){
			
			RequestDispatcher rd= request.getRequestDispatcher("/ClassroomController");
			rd.forward(request, response);
			
						
		}
		if(str.equals("/ClassroomEdit")){
	
			RequestDispatcher rd= request.getRequestDispatcher("/EditController");
			rd.forward(request, response);
		  
		
		}
		
	
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
