package com.laptrinhjavaweb.dto;

public class BillDto extends AbstractDTO<BillDto>{

	private Long idCustomer;
	private Long categoryId;
	private String categoryName;
	private String customerName;
	
	
	@Override
	public String toString() {
		return "Thể loại: " + categoryName + ", ghi chú: " + note + ", ngày bắt đầu: " + startDay + ", ngày kết thúc: " + endDay
				+ ", số tiền: " + money +  "$.";
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	private String note;
<<<<<<< HEAD
	private String customerFullName;
=======
	private String startDay;
	private String endDay;
	
	
	public String getStartDay() {
		return startDay;
	}

	public void setStartDay(String startDay) {
		this.startDay = startDay;
	}

	public String getEndDay() {
		return endDay;
	}

	public void setEndDay(String endDay) {
		this.endDay = endDay;
	}

>>>>>>> 15aeb8740bf440b60feb2cf7c18a8c68f9626125
	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public Long getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Long categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	private String money;
	private int status;

	

	

	public Long getIdCustomer() {
		return idCustomer;
	}

	public void setIdCustomer(Long idCustomer) {
		this.idCustomer = idCustomer;
	}


	public String getMoney() {
		return money;
	}

	public void setMoney(String money) {
		this.money = money;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getCustomerFullName() {
		return customerFullName;
	}

	public void setCustomerFullName(String customerFullName) {
		this.customerFullName = customerFullName;
	}


	

}
