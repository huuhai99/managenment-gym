package com.laptrinhjavaweb.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.laptrinhjavaweb.dto.BillDto;
import com.laptrinhjavaweb.service.IBillService;

@RestController
public class BillAPI {
	
	@Autowired
	private IBillService billService;
	
	
	@PostMapping("/api/bill")
	public BillDto createBill(@RequestBody BillDto billDTO) {
		return customerService.save(billDTO);
	}
	
	@PutMapping("/api/bill")
	public BillDto updateBill(@RequestBody BillDto updateBill) {
		return customerService.save(updateBill);
	}
	
	@DeleteMapping("/api/bill")
	public void deleteBill(@RequestBody long id) {
		billService.delete(id);
	}
}
