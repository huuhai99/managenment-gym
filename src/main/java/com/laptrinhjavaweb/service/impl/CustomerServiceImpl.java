package com.laptrinhjavaweb.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.laptrinhjavaweb.dto.CustomerDto;
import com.laptrinhjavaweb.entity.CustomerEntity;
import com.laptrinhjavaweb.repository.CustomerRepository;
import com.laptrinhjavaweb.service.ICustomerService;

@Service
public class CustomerServiceImpl implements ICustomerService {

	@Autowired
	private CustomerRepository customerRepository;
	
	@Override
	public List<CustomerDto> findAll() {
		List<CustomerDto> models = new ArrayList<>();
		List<CustomerEntity> entities = customerRepository.findAll();
		for (CustomerEntity item: entities) {
			CustomerDto customerDTO = new CustomerDto();
			customerDTO.setId(item.getId());
			customerDTO.setFullName(item.getFullName());
			customerDTO.setSex(item.getSex());
			customerDTO.setNumberphone(item.getNumberphone());
			customerDTO.setBirthday(item.getBirthday());
			customerDTO.setNote(item.getNote());
			models.add(customerDTO);
		}
		return models;
	}
	
	
	
	


	
}
