package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.Constant;
import com.dao.UserDao;
import com.vo.User;

@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginController() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String logout=request.getParameter("logout");
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");		
		
		UserDao ud = new UserDao();
     	User user = ud.getByUser(username);
	
     	
     	if(logout!=null){
     		System.out.println("logout");
     		
     		session.invalidate();
     		response.sendRedirect("/user/home");
     		
     		return ;
     	}
     	
     	session.setAttribute("username", user.getUsername());
		session.setAttribute("password", user.getPassword());
		
		
if(username!=null && user.getPassword().equals(password)){
		
		if(user.getUsertype()==Constant.USER_TYPE_STUDENT){
			response.sendRedirect("/Student"); 
			return ;
		}else if(user.getUsertype()==Constant.USER_TYPE_TEACHER){
			response.sendRedirect("/user/home");
			return;
		}
	      
		}

	
		
}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
