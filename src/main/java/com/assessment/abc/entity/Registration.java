package com.assessment.abc.entity;

public class Registration {
	private String firstname;
	private String lastname;
	private String address;
	private String contact;
	private String username;
	private String password;
	private String confirm_password;
	
	public Registration() {}
	
	public Registration(String firstname, String lastname, String address, String contact, String username,
			String password, String confirm_password) {
		super();
		this.firstname = firstname;
		this.lastname = lastname;
		this.address = address;
		this.contact = contact;
		this.username = username;
		this.password = password;
		this.confirm_password = confirm_password;
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getConfirm_password() {
		return confirm_password;
	}

	public void setConfirm_password(String confirm_password) {
		this.confirm_password = confirm_password;
	}
	
	
	
	
}
