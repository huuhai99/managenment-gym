package com.laptrinhjavaweb.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.laptrinhjavaweb.constant.SystemConstant;
import com.laptrinhjavaweb.converter.CustomerConverter;
import com.laptrinhjavaweb.dto.CustomerDto;
import com.laptrinhjavaweb.entity.CustomerEntity;
import com.laptrinhjavaweb.entity.UserEntity;
import com.laptrinhjavaweb.repository.CustomerRepository;
import com.laptrinhjavaweb.repository.UserRepository;
import com.laptrinhjavaweb.service.ICustomerService;

@Service
public class CustomerServiceImpl implements ICustomerService {

	@Autowired
	private CustomerRepository customerRepository;
	
	@Autowired
	private CustomerConverter customerConverter;
	
	@Autowired
	private UserRepository usersRepository;;
	
	@Override
	public List<CustomerDto> findAll() {
		List<CustomerDto> models = new ArrayList<>();
		List<CustomerEntity> entities = customerRepository.findAll();
		for (CustomerEntity item: entities) {
			CustomerDto customerDTO = customerConverter.toDto(item);
			models.add(customerDTO);
		}
		return models;
	}
	@Override
	public List<CustomerDto> findByStatus() {
		List<CustomerDto> models = new ArrayList<>();
		List<CustomerEntity> entities = customerRepository.findByStatus((long) SystemConstant.ACTIVE_STATUS);
		for (CustomerEntity item: entities) {
			CustomerDto customerDTO = customerConverter.toDto(item);
			models.add(customerDTO);
		}
		return models;
	}

	@Override
	public CustomerDto findById(long id) {
		CustomerEntity entity = customerRepository.findOne(id);
		return customerConverter.toDto(entity);
	}

	@Override
	@Transactional
	public CustomerDto save(CustomerDto dto) {
		CustomerEntity customerEntity = new CustomerEntity();
		if (dto.getId() != null) {
			CustomerEntity oldCustomer = customerRepository.findOne(dto.getId());
			customerEntity = customerConverter.toEntity(oldCustomer, dto);
		} else {
			customerEntity = customerConverter.toEntity(dto);
			customerEntity.setStatus((long) 1);
		}
		return customerConverter.toDto(customerRepository.save(customerEntity));
	}

	@Override
	@Transactional
	public void delete(long id) {
		CustomerEntity oldCustomer = customerRepository.findOne(id);
		oldCustomer.setStatus((long) 0);
		customerRepository.save(oldCustomer);
		
	}
	@Override
	public List<CustomerDto> findByIdUser(Long id) {
		UserEntity entity = usersRepository.findOne(id);
		List<CustomerEntity> listCustomer = customerRepository.findAll();
		List<CustomerDto> litsDtos = new ArrayList<>();
		for (CustomerEntity item : listCustomer) {
				UserEntity en = item.getEntity();
				CustomerDto customerDto = customerConverter.toDto(item);
				customerDto.setIdUser(en.getId());
				if(customerDto.getIdUser() == entity.getId()) {
					litsDtos.add(customerDto);
			}
			
		}
		return litsDtos;
	}
	public int getTotalCustomer() {
			return (int) customerRepository.countByStatus((long) SystemConstant.ACTIVE_STATUS);
	}
	@Override
	public int getTotalMaleCustomer() {
		return (int) customerRepository.countByStatusAndSex(((long) SystemConstant.ACTIVE_STATUS),"male");
	}
	@Override
	public int getTotalFemaleCustomer() {
		return (int) customerRepository.countByStatusAndSex(((long) SystemConstant.ACTIVE_STATUS),"female");
	}


	

	
	
	
	
	


	
}
