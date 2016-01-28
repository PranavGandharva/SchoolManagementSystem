package com.vo;

import java.util.ArrayList;
import java.util.List;

public class Course {

	private int id;
	private String coursename;
	private List grade_id;
	private List exam_res= new ArrayList<>();

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCoursename() {
		return coursename;
	}

	public void setCoursename(String coursename) {
		this.coursename = coursename;
	}

	public List getGrade_id() {
		return grade_id;
	}

	public void setGrade_id(List grade_id) {
		this.grade_id = grade_id;
	}

	public List getExam_res() {
		return exam_res;
	}

	public void setExam_res(List exam_res) {
		this.exam_res = exam_res;
	}
}
