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
		billDTO.setContent(entity.getContent());
		billDTO.setMoney(entity.getMoney());
		return billDTO;
	}
	
	public BillEntity toEntity(BillDto dto) {
		BillEntity result = new BillEntity();
		result.setContent(dto.getContent());
		result.setMoney(dto.getMoney());
		return result;
	}
	
	public BillEntity toEntity(BillEntity result, BillDto dto) {
		result.setContent(dto.getContent());
		result.setMoney(dto.getMoney());
		return result;
	}
}
