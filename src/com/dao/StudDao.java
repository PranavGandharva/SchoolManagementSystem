package com.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.vo.Student;

public class StudDao {
	public static SessionFactory factory;	
	
	public void delete(int id) {
		System.out.println("delere");
		
		Session session = GetSession.getSession();
		Student std = new Student();

	    Transaction tx=	session.beginTransaction();
		std=session.get(Student.class, id);

		session.delete(std);
		
	    tx.commit();
		session.close();

	}
	
	public Student getId(int id) {
		Student std= new Student();
		Session session=GetSession.getSession();
		String str="from Student where id=:id";
        
	    Query query = session.createQuery(str);
	    query.setInteger("id",id);
	  
	    std=(Student)query.list().get(0);
	    
	    session.close(); 
	    
	   return std;
	} 
	
	public Student update(int id, String firstname, String lastname, String email, String attendance, String phone) {
	
	Student std= new Student();	
	
    Session session=GetSession.getSession();
    Transaction tx= session.beginTransaction();		

	std=session.get(Student.class, id);	
	std.setFirstname(firstname);
	std.setLastname(lastname);
	std.setEmail(email);
	std.setAttendance(attendance);
	std.setPhone(phone);
	
	session.update(std);
	tx.commit();
	session.close();
	
	return std;
	}	

	public List<Student> select() {

		Session session = GetSession.getSession();
		Transaction tx = session.beginTransaction();

		String str = "FROM Student";
		List<Student> list = session.createQuery(str).list();

		tx.commit();
		session.close();

		return list;

	}

	public void insert(String firstname, String lastname, String email, String attendance, String photo, String phone, int enrollment) {
		Student std = new Student();
		Session session = GetSession.getSession();
		Transaction tx = session.beginTransaction();

		std.setFirstname(firstname);
		std.setLastname(lastname);
		std.setEmail(email);
		std.setPhone(phone);
		std.setAttendance(attendance);
		std.setPhoto(photo);
		std.setEnrollment(enrollment);

		session.save(std);

		tx.commit();
		session.close();

	}	
	
	public void multipart(Student std){
		
		Session session = GetSession.getSession();
		Transaction tx = session.beginTransaction();

		
		session.save(std);

		tx.commit();
		session.close();

	}
	
	
	public static void main(String[] args) {
		factory = new Configuration().configure().buildSessionFactory();
		
        new StudDao().getId(1);
        new StudDao().delete(2);
		//new StudDao().update(2,"raju", "kapoor", "kjh", "50%","5456213");
	}

}
