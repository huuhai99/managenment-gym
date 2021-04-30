package com.laptrinhjavaweb.dto;

public class UserDto {

	private String fullName;

	private String email;

	private String address;

	public String getFullName() {
		return fullName;
	}
	private String rest_password;

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

}
