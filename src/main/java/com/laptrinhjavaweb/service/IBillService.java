package com.laptrinhjavaweb.service;

import java.util.List;

import com.laptrinhjavaweb.dto.BillDto;

public interface IBillService {
	List<BillDto> findAll();
	List<BillDto> findByStatus();
	BillDto findById(long id);
	BillDto save(BillDto dto);
	void delete(long id);
	List<BillDto> findByStatusAndDate( Long year);
	List<BillDto> findByStatusAndDate( Long year, Long month);
	List<BillDto> findByStatusAndDate( Long year, Long month, Long day);
	int getTotalRevenue(String time,Long year, Long month, Long day);
	int countByCustomerId(Long id);
}
