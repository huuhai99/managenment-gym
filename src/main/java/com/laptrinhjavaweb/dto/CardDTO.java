package com.laptrinhjavaweb.dto;

public class CardDTO extends AbstractDTO<CardDTO> {

	private String issueDate;
	private String validUpto;
	private String status;
	private Long idCustomer;
	private String nameCustomer;
	private String numberPhoneCustomer;
	private String noteCustomer;
	
	private String title;
	private String start;
	private String end;
	private String description;	
	
	public String getIssueDate() {
		return issueDate;
	}

	public void setIssueDate(String issueDate) {
		this.issueDate = issueDate;
	}

	public String getValidUpto() {
		return validUpto;
	}

	public void setValidUpto(String validUpto) {
		this.validUpto = validUpto;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Long getIdCustomer() {
		return idCustomer;
	}

	public void setIdCustomer(Long idCustomer) {
		this.idCustomer = idCustomer;
	}

	public String getNameCustomer() {
		return nameCustomer;
	}

	public void setNameCustomer(String nameCustomer) {
		this.nameCustomer = nameCustomer;
	}



	public String getNumberPhoneCustomer() {
		return numberPhoneCustomer;
	}

	public void setNumberPhoneCustomer(String numberPhoneCustomer) {
		this.numberPhoneCustomer = numberPhoneCustomer;
	}

	public String getNoteCustomer() {
		return noteCustomer;
	}

	public void setNoteCustomer(String noteCustomer) {
		this.noteCustomer = noteCustomer;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getStart() {
		return start;
	}

	public void setStart(String start) {
		this.start = start;
	}

	public String getEnd() {
		return end;
	}

	public void setEnd(String end) {
		this.end = end;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	
	
	

}
