package com.laptrinhjavaweb.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "category")
public class CategoryEntity extends BaseEnetity {

	@Column(name = "name")
	private String name;

	@Column(name = "status")
	private String status;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "category")
	private List<BillEntity> listBill = new ArrayList<>();

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public List<BillEntity> getListBill() {
		return listBill;
	}

	public void setListBill(List<BillEntity> listBill) {
		this.listBill = listBill;
	}

	

}
