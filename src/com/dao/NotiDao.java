package com.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Restrictions;

import com.sun.org.apache.bcel.internal.generic.Select;
import com.vo.Notification;
import com.vo.Student;
import com.vo.Teacher;

public class NotiDao {
	
	public Student getNotiByEnroll(int enroll){
	
		Session session =GetSession.getSession();
        Criteria cr=session.createCriteria(Student.class);
	    List<Student>list=cr.add(Restrictions.eq("enrollment", enroll)).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
	    if(list.size()>0){
	    	return list.get(0);
	    }
		
	    session.close();
	    return null;
	
		
	}

	public void insert(Notification nt,Student student) {
		
		
		Session session = GetSession.getSession();
	    session.beginTransaction();

       
		session.merge(student);
		
	     
		
	    session.getTransaction().commit();
		session.close();

	}

	public static void main(String[] args) {
     new Configuration().configure().buildSessionFactory();
	
      

	}
	

		
}
