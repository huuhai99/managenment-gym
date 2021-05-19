package com.laptrinhjavaweb.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "customer")
public class CustomerEntity extends BaseEnetity {

	@Column(name = "fullname")
	private String fullName;

	@Column(name = "birthday")
	private String birthDay;

	@Column(name = "sex")
	private String sex;

	@Column(name = "numberphone")
	private String numberPhone;
 
	@Column(name = "note")
	private String note;

	@Column(name = "status")
	private Long status;

	@OneToMany(mappedBy = "customer")
	private List<BillEntity> bill = new ArrayList<>();

<<<<<<< HEAD
	@ManyToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "categoryid")
	private CategoryEntity category;
	
	@ManyToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "userid")	
	private UserEntity entity;
	

	@OneToMany(mappedBy = "customerEntity")
	private List<CardEntity> listCard = new ArrayList<>();
=======
>>>>>>> 01931e00168b8a9fc776bffab0e78775319707af
	

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getBirthDay() {
		return birthDay;
	}

	public void setBirthDay(String birthDay) {
		this.birthDay = birthDay;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getNumberPhone() {
		return numberPhone;
	}

	public void setNumberPhone(String numberPhone) {
		this.numberPhone = numberPhone;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public Long getStatus() {
		return status;
	}

	public void setStatus(Long status) {
		this.status = status;
	}

	public List<BillEntity> getBill() {
		return bill;
	}

	public void setBill(List<BillEntity> bill) {
		this.bill = bill;
	}

	

	public UserEntity getEntity() {
		return entity;
	}

	public void setEntity(UserEntity entity) {
		this.entity = entity;
	}
	

}
