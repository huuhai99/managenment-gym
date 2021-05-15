package com.laptrinhjavaweb.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.laptrinhjavaweb.dto.CustomerDto;
import com.laptrinhjavaweb.service.ICustomerService;

@RestController(value = "newAPIOfAdmin")
public class CustomerAPI {
	
	@Autowired
	private ICustomerService customerService;
	
	@PostMapping("/api/customer")
	public CustomerDto createCustomer(@RequestBody CustomerDto customerDTO) {
		return customerService.save(customerDTO);
	}
	
	@PutMapping("/api/customer")
	public CustomerDto updateNew(@RequestBody CustomerDto updateCustomer) {
		return customerService.save(updateCustomer);
	}
	
	@DeleteMapping("/api/customer")
	public void deleteNew(@RequestBody long id) {
		customerService.delete(id);
	}
}
