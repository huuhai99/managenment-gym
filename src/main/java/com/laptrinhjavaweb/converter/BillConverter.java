package com.laptrinhjavaweb.converter;

import org.springframework.stereotype.Component;

import com.laptrinhjavaweb.dto.BillDto;
import com.laptrinhjavaweb.entity.BillEntity;

@Component
public class BillConverter {

	public BillDto toDto(BillEntity entity) {
		BillDto billDTO = new BillDto();
		billDTO.setId(entity.getId());
		billDTO.setIdCustomer(entity.getCustomer().getId());
		billDTO.setCategoryId(entity.getCategory().getId());
		billDTO.setCategoryName((entity.getCategory().getName()));
		billDTO.setMoney(entity.getMoney());
		billDTO.setNote(entity.getNote());
		return billDTO;
	}
	
	public BillEntity toEntity(BillDto dto) {
		BillEntity result = new BillEntity();
		result.setMoney(dto.getMoney());
		result.setNote(dto.getNote());
		return result;
	}
	
	public BillEntity toEntity(BillEntity result, BillDto dto) {
		result.setMoney(dto.getMoney());
		result.setNote(dto.getNote());
		return result;
	}
}
