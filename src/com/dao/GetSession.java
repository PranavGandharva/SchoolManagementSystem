package com.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class GetSession {
	public static SessionFactory factory;

	public static Session  getSession() {
		if (factory == null) {
			factory = new Configuration().configure().buildSessionFactory();

		}
		return factory.openSession();

	}

}
