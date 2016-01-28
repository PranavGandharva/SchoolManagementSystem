package com.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.vo.Classroom;
import com.vo.Course;
import com.vo.Grade;

public class GradeDao {
	public static SessionFactory factory;

	public void insert(Classroom cr, Course course) {
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		session.save(cr);
		session.save(course);

		tx.commit();
		session.close();

	}

	public static void main(String[] args) {
		factory = new Configuration().configure().buildSessionFactory();

		Grade gr = new Grade();
		gr.setName("Grade A");
		gr.setDescription("fantastic");

		Grade gr1 = new Grade();
		gr1.setName("Grade B");
		gr1.setDescription("average");

		Grade gr2 = new Grade();
		gr2.setName("Grade C");
		gr2.setDescription("Poor");

		List<Grade> list = new ArrayList<>();
		list.add(gr);
		list.add(gr1);
		list.add(gr2);

		Classroom cr = new Classroom();
		cr.setGrade_id(list);
		
		Course course = new Course();
		course.setGrade_id(list);
       
		new GradeDao().insert(cr,course);
	}

}
