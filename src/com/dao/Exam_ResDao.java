package com.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Restrictions;

import com.vo.Course;
import com.vo.Exam_result;
import com.vo.Student;

public class Exam_ResDao {
	public static SessionFactory factory;

	public void insert(Student st, Course course) {
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();

		session.save(st);
		session.save(course);
		tx.commit();
		session.close();
	}

	public static void main(String[] args) {
		factory = new Configuration().configure().buildSessionFactory();

		Exam_result er = new Exam_result();
		er.setMarks("80");

		Criteria cr = factory.openSession().createCriteria(Student.class);
		cr.add(Restrictions.eq("id", 1));
		Student std = (Student) cr.list().get(0);
		er.getStudent_id().add(std);

		Criteria cr1 = factory.openSession().createCriteria(Course.class);
		cr1.add(Restrictions.eq("id", 1));
		System.out.println(cr1.list().get(0).getClass());
		Course cs = (Course) cr1.list().get(0);
		er.getCourse_id().add(cs);

		Student st = new Student();
		st.getExam_res_id().add(er);

		Course course = new Course();
		course.getExam_res().add(er);

		new Exam_ResDao().insert(st, course);
	}
}
