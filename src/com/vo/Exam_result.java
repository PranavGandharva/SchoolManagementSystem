package com.vo;

import java.util.ArrayList;
import java.util.List;

public class Exam_result {

	private int id;
	private Exam exam_id;
	private List student_id=new ArrayList<>();
	private List course_id= new ArrayList<>();
	private String marks;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Exam getExam_id() {
		return exam_id;
	}

	public void setExam_id(Exam exam_id) {
		this.exam_id = exam_id;
	}

	public List getStudent_id() {
		return student_id;
	}

	public void setStudent_id(List student_id) {
		this.student_id = student_id;
	}

	public List getCourse_id() {
		return course_id;
	}

	public void setCourse_id(List course_id) {
		this.course_id = course_id;
	}

	public String getMarks() {
		return marks;
	}

	public void setMarks(String marks) {
		this.marks = marks;
	}
}
