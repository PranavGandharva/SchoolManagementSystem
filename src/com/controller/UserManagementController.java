package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.Constant;
import com.dao.UserDao;
import com.vo.Student;
import com.vo.Teacher;
import com.vo.User;


@WebServlet("/UserManagementController")
public class UserManagementController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UserManagementController() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	System.out.println("heeeee");
		
    User user= new User(); 
    UserDao ud= new UserDao();
  
    user.setPassword("1234");
    user.setUsername("pranav");
    
  
    if(user.getUsertype()==Constant.USER_TYPE_STUDENT){
    	Student detail = new Student();
        detail.setFirstname("james");
        detail.setLastname("Bond");
        detail.setEmail("prava@gmail.com");
        detail.setAttendance("00%");
        detail.setPhone("7405306");
        detail.setEnrollment(8487548);
        detail.setPhoto("47.jpg");
       
        
        ud.insert(user, detail);
	
    } else if(user.getUsertype()==Constant.USER_TYPE_TEACHER){
     	Teacher detail = new Teacher();
    	
    	detail.setFirstname("monika");
    	detail.setLastname("sinha");
    	detail.setEmail("sf@fd");
    	detail.setPhonenumber("4754");
    	
    	ud.insert(user, detail); 
    	
    }
	
	
	

	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
