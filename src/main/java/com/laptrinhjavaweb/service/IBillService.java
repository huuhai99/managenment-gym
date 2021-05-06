package com.laptrinhjavaweb.service;

import java.util.List;

import com.laptrinhjavaweb.dto.BillDto;

public interface IBillService {
	List<BillDto> findAll();
	
	
}
