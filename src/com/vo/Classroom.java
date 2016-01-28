package com.vo;

import java.util.List;

public class Classroom {

	private int id;
	private String year;
	private List grade_id;
	private String name;
	private List teacher_id;
	private List student_id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List getGrade_id() {
		return grade_id;
	}

	public void setGrade_id(List grade_id) {
		this.grade_id = grade_id;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public List getTeacher_id() {
		return teacher_id;
	}

	public void setTeacher_id(List teacher_id) {
		this.teacher_id = teacher_id;
	}

	public List getStudent_id() {
		return student_id;
	}

	public void setStudent_id(List student_id) {
		this.student_id = student_id;
	}

}
