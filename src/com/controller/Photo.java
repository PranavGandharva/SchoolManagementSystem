package com.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.vo.Student;


@WebServlet("/Photo")
public class Photo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Photo() {
    }
	@SuppressWarnings("resource")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	Student std =new Student();
	OutputStream os = response.getOutputStream();
	String filepath="E:\\studentData\\";
	String enroll=request.getParameter("enrollment");
	InputStream fi =null;
	

	
	
	fi=	new FileInputStream(new File(filepath+Integer.parseInt(enroll)+".jpg")); 
    BufferedImage bi = ImageIO.read(fi);
	OutputStream out = response.getOutputStream();
	ImageIO.write(bi,"jpg",out);
	
	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
