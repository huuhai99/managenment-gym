package com.laptrinhjavaweb.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "User")
public class UserEntity extends BaseEnetity {

	@Column(name = "username")
	private String userName;

	@Column(name = "password")
	private String password;

	@Column(name = "fullname")
	private String fullName;

	@Column(name = "email")
	private String email;

	@Column(name = "status")
	private Integer status;
	
	@Column(name = "comfirmtoken")
	private String confirmToken;

	@Transient
	private String repeatPass;

	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "user_role", joinColumns = @JoinColumn(name = "userid"), inverseJoinColumns = @JoinColumn(name = "roleid"))
	private List<RoleEntity> roles = new ArrayList<>();

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public List<RoleEntity> getRoles() {
		return roles;
	}

	public void setRoles(List<RoleEntity> roles) {
		this.roles = roles;
	}

	public String getRepeatPass() {
		return repeatPass;
	}

	public void setRepeatPass(String repeatPass) {
		this.repeatPass = repeatPass;
	}

	public String getConfirmToken() {
		return confirmToken;
	}

	public void setConfirmToken(String confirmToken) {
		this.confirmToken = confirmToken;
	}



	

}
