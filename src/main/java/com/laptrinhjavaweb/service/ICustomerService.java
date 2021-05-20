package com.laptrinhjavaweb.service;

import java.util.List;

import com.laptrinhjavaweb.dto.CustomerDto;

public interface ICustomerService {
	List<CustomerDto> findAll();
	List<CustomerDto> findByStatus();
	CustomerDto findById(long id);
	CustomerDto save(CustomerDto dto);
	void delete(long id);
	List<CustomerDto> findByIdUser(Long id);
	List<CustomerDto> findByStatusAndDate( Long year);
	List<CustomerDto> findByStatusAndDate( Long year, Long month);
	List<CustomerDto> findByStatusAndDate( Long year, Long month, Long day);
	int getTotalCustomer(String time,String year, String month, String day);
	int getTotalMaleCustomer(String time,String year, String month, String day);
	int getTotalFemaleCustomer(String time,String year, String month, String day);
}
