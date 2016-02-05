package com.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Restrictions;
import org.hibernate.exception.ConstraintViolationException;

import com.vo.Classroom;
import com.vo.Student;



public class ClassDao {
	public static SessionFactory factory;
	
	
public boolean	valid(String name, String year){
	//Classroom cr = new Classroom();
	List<Classroom> list;
			
		String str = "FROM Classroom where name=:name or year=:year";
		Session session = GetSession.getSession();
	

		Query query = session.createQuery(str);
		query.setParameter("name", name);
		query.setParameter("year", year);

        list=query.list();
		
	
    
		session.close();

		return list.size()==0;
}
	
	
	
	
	public void delete(int id) {
		Classroom cr = new Classroom();
		Session session = GetSession.getSession();
		Transaction tx = session.beginTransaction();
		cr = session.get(Classroom.class, id);

		session.delete(cr);
        
		tx.commit();
		session.close();
	}
	
	public Classroom update(String name, String year, int id) {

		Session session = GetSession.getSession();
		Classroom cr = new Classroom();

		Transaction tx = session.beginTransaction();
		cr=session.get(Classroom.class, id);
		cr.setName(name);
		cr.setYear(year);

		session.update(cr);

		
		tx.commit();
		session.close();
		
		return cr; 
	}	
	
	public Classroom getById(int id){
		
		String str = "FROM Classroom where id=:id";

		Session session = GetSession.getSession();

		Transaction tx = session.beginTransaction();
		Query query = session.createQuery(str);

		query.setInteger("id", id);

		Classroom cr = (Classroom) query.list().get(0);
        	    
		tx.commit();
		session.close();
			
		
		
		return  cr;
		
	}

	public void insert(String name, String year) {
		ClassDao cd= new ClassDao();
		Classroom cr= new Classroom();
		
		if(cd.valid(name, year)){
		
		Session session = GetSession.getSession();
		Transaction tx = session.beginTransaction();

		
		cr.setName(name);
		cr.setYear(year);
		
        session.save(cr);
		
		
		tx.commit();
		session.close();
		}
	}

	public List select() {
		
		
		Session session = GetSession.getSession();
		Transaction tx = session.beginTransaction();

		List<Classroom> list = session.createQuery("FROM Classroom").list();

		tx.commit();
		session.close();

		return list;
	}

	public static void main(String[] args) {
		factory = new Configuration().configure().buildSessionFactory();
		Classroom cr = new Classroom();
		cr.setName("class B");
		cr.setYear("2008");

		Classroom cr1 = new Classroom();
		cr1.setName("class C");
		cr1.setYear("2009");

		Classroom cr2 = new Classroom();
		cr2.setName("class A");
		cr2.setYear("2010");

//		new ClassDao().getById(5);
//		new ClassDao().update("pra","nav",9);	
		//new ClassDao().delete(6);
				
		new ClassDao().valid("pranav","adsas");
	}



	
}
