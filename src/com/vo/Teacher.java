package com.vo;

import java.util.ArrayList;
import java.util.List;

import org.codehaus.jackson.annotate.JacksonAnnotation;

public class Teacher {

	private int id;
	private String firstname;
	private String lastname;
	private String phonenumber;
	private String email;
	private List notification= new ArrayList<>();
	

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

	public String getPhonenumber() {
		return phonenumber;
	}

	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}

	public List getNotification() {
		return notification;
	}

	public void setNotification(List notification) {
		this.notification = notification;
	}
}
