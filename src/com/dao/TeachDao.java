package com.dao;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.vo.Classroom;
import com.vo.Teacher;

public class TeachDao {
	public static SessionFactory factory;
	
	public void delete(int id) {
		Teacher tech = new Teacher();
		Session session = GetSession.getSession();
		Transaction tx = session.beginTransaction();

		tech = session.get(Teacher.class, id);
		session.delete(tech);

		tx.commit();
		session.close();
	}

	public Teacher update(int id, String firstname, String lastname, String email, String phonenumber){
		
		Session session = GetSession.getSession();
	    Transaction tx=	session.beginTransaction();
	    Teacher tech = new Teacher();
		
	    
	    tech= session.get(Teacher.class, id);		
	    tech.setFirstname(firstname);
	    tech.setLastname(lastname);
	    tech.setEmail(email);
	    tech.setPhonenumber(phonenumber);
	    
	    session.update(tech);
	    
	    tx.commit();
	    session.close();
	
	return tech;
	}
	

public void	insert(String firstname, String lastname, String email, String phonenumber){
		
		Session session = GetSession.getSession();
		Transaction tx = session.beginTransaction();

		Teacher tech = new Teacher();

		tech.setFirstname(firstname);
		tech.setLastname(lastname);
		tech.setEmail(email);
		tech.setPhonenumber(phonenumber);

        session.save(tech);
        
        tx.commit();
        session.close();
}
	
	public Teacher getById(int id) {
        Teacher tech = new Teacher();
		
		String str = "from Teacher where id=:id";
		Session session = GetSession.getSession();

		Query query = session.createQuery(str);
		query.setInteger("id", id);

	tech=(Teacher)query.list().get(0);

	return tech;
	}	
	
//	public void insert(Teacher teach,Object detail) {
//		Session session = GetSession.getSession();
//		Transaction tx=session.beginTransaction();
//		
//		teach.setFirstname((String) detail);
//		teach.setEmail((String) detail);
//		teach.setLastname((String)detail);
//		teach.setPhonenumber((String)detail);
//		
//		session.save(teach);
//		
//		tx.commit();
//		session.close();
//		
//	}
	
	public List<Teacher> select() {

	Session session= GetSession.getSession();
	Transaction tx=session.beginTransaction();
	
		String str = "From Teacher";
		List<Teacher> list= session.createQuery(str).list();
		
	    tx.commit();
	    session.close();
		
	return list;
	}
	
	public static void main(String[] args) {
		factory = new Configuration().configure().buildSessionFactory();
		
		

			}

}
