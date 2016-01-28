package com.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.vo.Exam;

import sun.java2d.pipe.SpanShapeRenderer.Simple;

public class ExamDao {
	public static SessionFactory factory;

	public void insert(Exam ex) {
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();

		session.save(ex);
		tx.commit();
		session.close();

	}

	public static void main(String[] args) {
		factory = new Configuration().configure().buildSessionFactory();

		Exam ex = new Exam();
		ex.setExamname("maths");

		Date date = new Date();

		SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd");
		try {
			date = sdf.parse("93-06-27");
		} catch (ParseException e) {
			e.printStackTrace();
		}

		ex.setStart_date(date);

		ExamDao ed = new ExamDao();
		ed.insert(ex);

	}
}
