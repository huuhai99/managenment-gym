package com.laptrinhjavaweb.converter;

import org.springframework.stereotype.Component;

import com.laptrinhjavaweb.dto.CustomerDto;
import com.laptrinhjavaweb.entity.CustomerEntity;

@Component
public class CustomerConverter {

	public CustomerDto toDto(CustomerEntity entity) {
		CustomerDto customerDTO = new CustomerDto();
		customerDTO.setId(entity.getId());
		customerDTO.setFullName(entity.getFullName());
		customerDTO.setSex(entity.getSex());
		customerDTO.setNumberPhone(entity.getNumberPhone());
		customerDTO.setBirthday(entity.getBirthDay());
		customerDTO.setNote(entity.getNote());
		return customerDTO;
	}
	
	public CustomerEntity toEntity(CustomerDto dto) {
		CustomerEntity result = new CustomerEntity();
		result.setFullName(dto.getFullName());
		result.setSex(dto.getSex());
		result.setNumberPhone(dto.getNumberPhone());
		result.setBirthDay(dto.getBirthday());
		result.setNote(dto.getNote());
		return result;
	}
	
	public CustomerEntity toEntity(CustomerEntity result, CustomerDto dto) {
		result.setFullName(dto.getFullName());
		result.setSex(dto.getSex());
		result.setNumberPhone(dto.getNumberPhone());
		result.setBirthDay(dto.getBirthday());
		result.setNote(dto.getNote());
		return result;
	}
}
