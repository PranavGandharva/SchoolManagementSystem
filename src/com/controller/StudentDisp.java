  package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.ClassDao;
import com.dao.StudDao;
import com.dao.TeachDao;
import com.vo.Classroom;
import com.vo.Notification;
import com.vo.Student;
import com.vo.Teacher;
import com.vo.User;

@WebServlet("/StudentDisp")
public class StudentDisp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public StudentDisp() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	HttpSession  session= request.getSession();
     	String str=	request.getRequestURI().replace(request.getContextPath(),"");
	
	
System.out.println("REQ" + request.getRequestURL() + " STR: " + str);

		if (str.equals("/addUser")) {
			System.out.println("heerer");
			RequestDispatcher rd = request.getRequestDispatcher("/UserManagementController");
			rd.forward(request, response);
		}

		else if (str.equals("/login")) {
			if(session.getAttribute("user")!=null){
				response.sendRedirect("teacher/form");
				return;
			}
			RequestDispatcher rd = request.getRequestDispatcher("pages/login.jsp");
			rd.forward(request, response);

		}

		else if (str.equals("/Student/form")) {
			StudDao sd = new StudDao();
			List<Student> list = sd.select();
			request.setAttribute("List", list);

			RequestDispatcher rd = request.getRequestDispatcher("/pages/strudentform.jsp");
			rd.forward(request, response);

		}	  
	   
		else if (str.equals("/EditStudents")) {

			RequestDispatcher rd = request.getRequestDispatcher("/StudentEditController");
			rd.forward(request, response);

		}

		else if (str.equals("/user/home")) {

			ClassDao cd = new ClassDao();
			List<Classroom> list = cd.select();
			request.setAttribute("List", list);

			RequestDispatcher rd = request.getRequestDispatcher("/pages/form.jsp");
			rd.forward(request, response);

		} else if (str.equals("/AddTeacher")) {
			System.out.println("hieee");
			RequestDispatcher rd = request.getRequestDispatcher("/Teacher");
			rd.forward(request, response);

		}else if(str.equals("/teacher/form")){
			TeachDao td = new TeachDao();
		    List<Teacher>list=td.select();
			request.setAttribute("List",list);
			
	        RequestDispatcher rd=request.getRequestDispatcher("/pages/teacherform.jsp");
		    rd.forward(request, response);
		}else if(str.equals("/teacher/notification")){
			
			ClassDao cd= new ClassDao();
            List<Classroom> list=cd.select();
            request.setAttribute("List", list);		
            
           RequestDispatcher rd=request.getRequestDispatcher("../teacher/TeacherNotification.jsp");
           rd.forward(request, response);		
		}

		else if (str.equals("/Student/home")) {
			   	
			User user=(User)session.getAttribute("user");
			
			session.setAttribute("UserNotification",user.getStudent().getNotification());
			
			
			RequestDispatcher rd = request.getRequestDispatcher("/pages/studentheader.jsp");
			rd.forward(request, response);
		} else if (str.equals("/user/home")) {

			RequestDispatcher rd = request.getRequestDispatcher("/userFragment.jsp");
			rd.forward(request, response);
		} else if (str.equals("/admin/home")) {

			RequestDispatcher rd = request.getRequestDispatcher("../admin/adminFragment.jsp");
			rd.forward(request, response);

		}
		else if(str.equals("/teacher/sendNotification")){
			
		RequestDispatcher rd=	request.getRequestDispatcher("/teacher/NotificationController");
		rd.forward(request, response);
		}
		

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String str = request.getRequestURI().replace(request.getContextPath(), "");
		if (str.equals("/AddStudents")) {
			
			RequestDispatcher rd = request.getRequestDispatcher("/StudentController");
			rd.forward(request, response);

		}
	}

}
