package com.vo;

import java.util.Date;

public class Exam {
	private int id;
	private String Examname;
	private Date Start_date;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getExamname() {
		return Examname;
	}

	public void setExamname(String examname) {
		Examname = examname;
	}

	public Date getStart_date() {
		return Start_date;
	}

	public void setStart_date(Date start_date) {
		Start_date = start_date;
	}

}
