package com.laptrinhjavaweb.service;

import java.util.List;

import com.laptrinhjavaweb.dto.CustomerDto;

public interface ICustomerService {
	List<CustomerDto> findAll();
	List<CustomerDto> findByStatus();
	CustomerDto findById(long id);
	CustomerDto save(CustomerDto dto);
	void delete(long id);
	
	
}
