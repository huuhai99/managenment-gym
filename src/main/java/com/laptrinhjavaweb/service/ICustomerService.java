package com.laptrinhjavaweb.service;

import java.util.List;

import com.laptrinhjavaweb.dto.CustomerDto;

public interface ICustomerService {
	List<CustomerDto> findAll();
	List<CustomerDto> findByStatus();
	CustomerDto findById(long id);
	CustomerDto save(CustomerDto dto);
	void delete(long id);
<<<<<<< HEAD
	List<CustomerDto> findByIdUser(Long id);
=======
	int getTotalCustomer();
	int getTotalMaleCustomer();
	int getTotalFemaleCustomer();
	
	
>>>>>>> 01931e00168b8a9fc776bffab0e78775319707af
}
