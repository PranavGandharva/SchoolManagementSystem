package com.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.vo.Parent;

public class ParentDao {
	public static SessionFactory factory;

	public void insert(Parent pr) {
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();

		session.save(pr);

		tx.commit();
		session.close();

	}

	public static void main(String[] args) {
		factory = new Configuration().configure().buildSessionFactory();
		Parent pr = new Parent();
		pr.setParents_name("Rajesh");
		pr.setParents_lastname("Gandharva");
		pr.setEmail("pranavgandharva@gmail.com");
		pr.setPhone("9426420084");

		new ParentDao().insert(pr);

	}

}
