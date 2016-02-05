package com.vo;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

public class Student {

	@Override
	public String toString() {
		return "Student [id=" + id + ", firstname=" + firstname + ", lastname=" + lastname + ", phone=" + phone
				+ ", parents_Id=" + parents_Id + ", email=" + email + ", attendance=" + attendance + ", photo=" + photo
				+ ", Exam_res_id=" + Exam_res_id + "]";
	}
//ctrl +shift+s
	private int id;
	private String firstname;
	private String lastname;
	private String phone;
	private Parent parents_Id;
	private String email;
	private String attendance;
	private int enrollment;
	private String photo;
	private Classroom student_id;
	private List notification=new ArrayList<>();
	private List Exam_res_id = new ArrayList<>();

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Parent getParents_Id() {
		return parents_Id;
	}

	public void setParents_Id(Parent parents_Id) {
		this.parents_Id = parents_Id;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAttendance() {
		return attendance;
	}

	public void setAttendance(String attendance) {
		this.attendance = attendance;
	}

	public List getExam_res_id() {
		return Exam_res_id;
	}

	public void setExam_res_id(List exam_res_id) {
		Exam_res_id = exam_res_id;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public int getEnrollment() {
		return enrollment;
	}
	public void setEnrollment(int enrollment) {
		this.enrollment = enrollment;
	}
	public List getNotification() {
		return notification;
	}
	public void setNotification(List notification) {
		this.notification = notification;
	}

	public Classroom getStudent_id() {
		return student_id;
	}

	public void setStudent_id(Classroom student_id) {
		this.student_id = student_id;
	}
}