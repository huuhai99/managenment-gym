package com.laptrinhjavaweb.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.laptrinhjavaweb.dto.BillDto;
import com.laptrinhjavaweb.dto.CustomerDto;
import com.laptrinhjavaweb.service.IBillService;
import com.laptrinhjavaweb.service.ICustomerService;

@RestController
public class BillAPI {
	
	@Autowired
	private IBillService customerService;
	
	@PostMapping("/api/bill")
	public BillDto createBill(@RequestBody BillDto billDTO) {
		return billService.save(billDTO);
	}
	
	@PutMapping("/api/bill")
	public BillDto updateBill(@RequestBody BillDto updateBill) {
		return billService.save(updateBill);
	}
	
	@DeleteMapping("/api/bill")
	public void deleteBill(@RequestBody long id) {
		customerService.delete(id);
	}
}
