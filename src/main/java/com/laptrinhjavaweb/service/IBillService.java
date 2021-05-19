package com.laptrinhjavaweb.service;

import java.util.List;

import com.laptrinhjavaweb.dto.BillDto;

public interface IBillService {
	List<BillDto> findAll();
	List<BillDto> findByStatus();
	BillDto findById(long id);
	BillDto save(BillDto dto);
	void delete(long id);
	
}
