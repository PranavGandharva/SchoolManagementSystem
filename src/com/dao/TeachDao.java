package com.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.vo.Classroom;
import com.vo.Teacher;

public class TeachDao {
	public static SessionFactory factory;

	public void insert(Object cr) {
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		session.save(cr);

		tx.commit();
		session.close();

	}

	public static void main(String[] args) {
		factory = new Configuration().configure().buildSessionFactory();
		Teacher tech = new Teacher();
		tech.setFirstname("pranav");
		tech.setLastname("gandharva");
		tech.setPhonenumber("740535858");
		tech.setEmail("pranavgandha@g.com");

		List<Teacher> list = new ArrayList<>();
		list.add(tech);

		Classroom cr = new Classroom();
		cr.setTeacher_id(list);

		new TeachDao().insert(cr);
	}

}
