package com.laptrinhjavaweb.service;

import java.util.List;

import com.laptrinhjavaweb.dto.CustomerDto;

public interface ICustomerService {
	List<CustomerDto> findAll();
	
	
}
