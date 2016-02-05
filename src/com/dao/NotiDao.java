package com.dao;

import org.hibernate.Session;
import org.hibernate.cfg.Configuration;

public class NotiDao {

	public static void main(String[] args) {
     new Configuration().configure().buildSessionFactory();
		
	}
	
}
