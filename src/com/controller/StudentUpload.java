package com.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.dao.StudDao;
import com.vo.Student;


@WebServlet("/StudentUpload")
public class StudentUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public StudentUpload() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

	
	}

	@SuppressWarnings("unused")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("start");
		boolean multipart=	ServletFileUpload.isMultipartContent(request);
		int fileSizeMax=5*1024*1024;
		File file;
		String filepath="E:\\studentData\\";
        
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
				if (!multipart) {
					out.print("<html>"+
				              "<body>" + 
							  "<p>no data</p>" + 
				              "</body>" +
							  "</html>");

				}
				DiskFileItemFactory factory= new DiskFileItemFactory();
				factory.setSizeThreshold(fileSizeMax);
				factory.setRepository(new File("E:\\studentData\\"));     /// (//)this will allow to make folder otherwise it will be a folder
				
				ServletFileUpload upload = new ServletFileUpload(factory);
				upload.setSizeMax(fileSizeMax);
				
				
					
					try {
						Student std= new Student();
						StudDao sd= new StudDao();
						
					@SuppressWarnings("rawtypes")
					List fileitems = upload.parseRequest(request);
						Iterator i=	fileitems.iterator();

						String enrollment= null;
						String photo =null;
						while(i.hasNext()){
							
							FileItem fi=(FileItem) i.next();
					System.out.println("fieldName:"+fi.getFieldName());
				                    
							
									if(((FileItem) fi).isFormField()){
							
							String name = fi.getFieldName();
							String value = fi.getString();
							
							
							if(name.equals("firstname")){
							std.setFirstname(value);	
							}
							else	if(name.equals("lastname")){
								std.setLastname(value);
							}
							else if(name.equals("phone")){
							std.setPhone(value);	
							}
							else if(name.equals("email")){
								std.setEmail(value);
							}
							else if(name.equals("attendance")){
							std.setAttendance(value);	
							}
							else if(name.equals("enrollment")){
								enrollment = value;
								System.out.println("enrollment number"+enrollment);
								std.setEnrollment(Integer.parseInt(enrollment));
							}
							
						
						} else {
							String fieldName = fi.getFieldName();
				            String fileName = fi.getName();
				            String contentType = fi.getContentType();
				            boolean isInMemory = fi.isInMemory();
				            long sizeInBytes = fi.getSize();
				          
				            
				            if( fileName.lastIndexOf("\\") >= 0 ){
				                file = new File( filepath +
				                fileName.substring( fileName.lastIndexOf("\\"))) ;
				               
				            }else{
				            	
				            	 ///System.out.println(enrollment);
			                       file = new File( filepath + enrollment + ".jpg" ); 
			    	         //               fileName.substring(fileName.lastIndexOf("\\")+1)) ;
			                                std.setPhoto(file.getName());
//			                                System.out.println("filename:"+fileName);
//			                                System.out.println("filepath:"+filepath);
			                              // System.out.println("file: " + file.getAbsolutePath());
			    	                     } fi.write( file ) ;
						}
									
								}
//						System.out.println("std"+std);
						sd.multipart(std);
						response.sendRedirect("/user/Student");
					}
					catch (FileUploadException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
			
//					System.out.println("end");
	}
}
