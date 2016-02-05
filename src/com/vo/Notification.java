package com.vo;

import java.util.Date;

import com.vo.Student;
import com.vo.Teacher;

public class Notification {
	private int id;
	private Student student;
	private Teacher teacher;
	private String Remark;
	private Date date;
	private boolean read;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	public Teacher getTeacher() {
		return teacher;
	}
	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}
	
	public String getRemark() {
		return Remark;
	}
	public void setRemark(String remark) {
		Remark = remark;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	public boolean getRead() {
          return read;
	}
	public void setRead(boolean read) {
		this.read = read;
	}
	

}
