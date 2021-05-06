package com.laptrinhjavaweb.dto;

public class CustomerDto extends AbstractDTO<CustomerDto>{

	private String fullName;
	private String birthday;
	private String sex;
	private String numberphone;
	private String note;
	private int status;

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getNumberphone() {
		return numberphone;
	}

	public void setNumberphone(String numberphone) {
		this.numberphone = numberphone;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	

}
