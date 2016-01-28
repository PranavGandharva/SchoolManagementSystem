package com.dao;

import java.util.ArrayList;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.vo.Course;
import com.vo.Grade;

public class CourseDao {
	public static SessionFactory factory;

	public void insert(Course cs, Course cs1, Course cs2) {
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		session.save(cs);
		session.save(cs1);
		session.save(cs2);

		tx.commit();
		session.close();
	
	}

	public static void main(String[] args) {
		factory = new Configuration().configure().buildSessionFactory();
		Course cs = new Course();
		cs.setCoursename("Java");

		Course cs1 = new Course();
		cs1.setCoursename("DotNet");

		Course cs2 = new Course();
		cs2.setCoursename("VB");

		new CourseDao().insert(cs, cs1, cs2);

	}

}
