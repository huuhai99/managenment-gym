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
	private UserRepository userRepository;
	
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
		UserEntity userEntity = userRepository.findOne((long) 1);
		if (dto.getId() != null) {
			CustomerEntity oldCustomer = customerRepository.findOne(dto.getId());
			oldCustomer.setEntity(userEntity);
			customerEntity = customerConverter.toEntity(oldCustomer, dto);
		} else {
			customerEntity = customerConverter.toEntity(dto);
			customerEntity.setStatus((long) 1);
			customerEntity.setEntity(userEntity);
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
	public int getTotalCustomer(String time,String year, String month, String day) {
		List<CustomerDto> models = new ArrayList<>();
		Long y = Long.parseLong(year);
		Long m = Long.parseLong(month);
		Long d = Long.parseLong(day);
		if (time == null) {
			models = findByStatusAndDate(y);
		}
		else if(time.equals("ngay")){
			models = findByStatusAndDate(y,m,d);
		}
		else if(time.equals("thang")){
			models = findByStatusAndDate(y,m);
				}
		else if(time.equals("nam")){
			models = findByStatusAndDate(y);
		}
		return models.size();
	}
	@Override
	public int getTotalMaleCustomer(String time,String year, String month, String day) {
		Long y = Long.parseLong(year);
		Long m = Long.parseLong(month);
		Long d = Long.parseLong(day);
		int sum=0;
		List<CustomerDto> models = new ArrayList<>();
		if (time == null) {
			models = findByStatusAndDate(y);
		}
		else if(time.equals("ngay")){
			models = findByStatusAndDate(y,m,d);
		}
		else if(time.equals("thang")){
			models = findByStatusAndDate(y,m);
				}
		else if(time.equals("nam")){
			models = findByStatusAndDate(y);
		}
		for(int i=0;i<models.size();i++) {
			if(models.get(i).getSex().equals("Nam")) {
				sum++;
			}
		}
		return sum;
	}
	@Override
	public int getTotalFemaleCustomer(String time,String year, String month, String day) {
		Long y = Long.parseLong(year);
		Long m = Long.parseLong(month);
		Long d = Long.parseLong(day);
		int sum=0;
		List<CustomerDto> models = new ArrayList<>();
		if (time == null) {
			models = findByStatusAndDate(y);
		}
		else if(time.equals("ngay")){
			models = findByStatusAndDate(y,m,d);
		}
		else if(time.equals("thang")){
			models = findByStatusAndDate(y,m);
				}
		else if(time.equals("nam")){
			models = findByStatusAndDate(y);
		}
		for(int i=0;i<models.size();i++) {
			if(models.get(i).getSex().equals("Nữ")) {
				sum++;
			}
		}
		return sum;
	}
	@Override
	public List<CustomerDto> findByStatusAndDate( Long year) {
		List<CustomerDto> models = new ArrayList<>();
		List<CustomerEntity> entities = customerRepository.findByStatusAndDate((long) SystemConstant.ACTIVE_STATUS,year);
		for (CustomerEntity item: entities) {
			CustomerDto customerDTO = customerConverter.toDto(item);
			models.add(customerDTO);
		}
		return models;
	}
	@Override
	public List<CustomerDto> findByStatusAndDate( Long year, Long month) {
		List<CustomerDto> models = new ArrayList<>();
		List<CustomerEntity> entities = customerRepository.findByStatusAndDate((long) SystemConstant.ACTIVE_STATUS, year, month);
		for (CustomerEntity item: entities) {
			CustomerDto customerDTO = customerConverter.toDto(item);
			models.add(customerDTO);
		}
		return models;
	}
	@Override
	public List<CustomerDto> findByStatusAndDate( Long year, Long month, Long day) {
		List<CustomerDto> models = new ArrayList<>();
		List<CustomerEntity> entities = customerRepository.findByStatusAndDate((long) SystemConstant.ACTIVE_STATUS, year, month,day);
		for (CustomerEntity item: entities) {
			CustomerDto customerDTO = customerConverter.toDto(item);
			models.add(customerDTO);
		}
		return models;
	}
	@Override
	public boolean existsByUserName(String fullName) {
		return customerRepository.existsByFullName(fullName);
	}


	

	
	
	
	
	


	
}
