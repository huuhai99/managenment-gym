package com.laptrinhjavaweb.dto;

public class ThongKeDto extends AbstractDTO<ThongKeDto>{

	private int totalCustomer;
	private int maleCustomer;
	private int femaleCustomer;
	
	
	public int getTotalCustomer() {
		return totalCustomer;
	}
	public void setTotalCustomer(int totalCustomer) {
		this.totalCustomer = totalCustomer;
	}
	public int getMaleCustomer() {
		return maleCustomer;
	}
	public void setMaleCustomer(int maleCustomer) {
		this.maleCustomer = maleCustomer;
	}
	public int getFemaleCustomer() {
		return femaleCustomer;
	}
	public void setFemaleCustomer(int femaleCustomer) {
		this.femaleCustomer = femaleCustomer;
	}

	

}
