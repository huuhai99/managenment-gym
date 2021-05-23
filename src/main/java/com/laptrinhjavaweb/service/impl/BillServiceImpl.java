package com.laptrinhjavaweb.service.impl;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.laptrinhjavaweb.constant.SystemConstant;
import com.laptrinhjavaweb.converter.BillConverter;
import com.laptrinhjavaweb.dto.BillDto;
import com.laptrinhjavaweb.entity.BillEntity;
import com.laptrinhjavaweb.entity.CategoryEntity;
import com.laptrinhjavaweb.entity.CustomerEntity;
import com.laptrinhjavaweb.repository.BillRepository;
import com.laptrinhjavaweb.repository.CategoryRepository;
import com.laptrinhjavaweb.repository.CustomerRepository;
import com.laptrinhjavaweb.service.IBillService;

@Service
public class BillServiceImpl implements IBillService {

	@Autowired
	private BillRepository billRepository;
	
	@Autowired
	private CustomerRepository customerRepository;
	
	@Autowired
	private CategoryRepository categoryRepository;
	
	@Autowired
	private BillConverter billConverter;
	
	@Override
	public List<BillDto> findAll() {
		List<BillDto> models = new ArrayList<>();
		List<BillEntity> entities = billRepository.findAll();
		for (BillEntity item: entities) {
			CustomerEntity customerEntity = item.getCustomer();
			BillDto billDTO = billConverter.toDto(item);
			billDTO.setCustomerFullName(customerEntity.getFullName());
			models.add(billDTO);
		}
		return models;
	}
	
	public Date timestampToDate(Timestamp ts) {
        Date date=new Date(ts.getTime());  
        return date;
	}
	public Timestamp dateToTimestamp(Date date) {
        Timestamp ts=new Timestamp(date.getTime());  
        return ts;
        
	}

	@Override
	public List<BillDto> findByStatus() {
		List<BillDto> models = new ArrayList<>();
		List<BillEntity> entities = billRepository.findByStatus((long) SystemConstant.ACTIVE_STATUS);
		for (BillEntity item: entities) {
			CustomerEntity customerEntity = item.getCustomer();
			BillDto billDTO = billConverter.toDto(item);
			billDTO.setCustomerFullName(customerEntity.getFullName());
			models.add(billDTO);
		}
		return models;
	}

	@Override
	public BillDto findById(long id) {
		BillEntity entity = billRepository.findOne(id);
		return billConverter.toDto(entity);
	}

	@Override
	@Transactional
	public BillDto save(BillDto dto) {
		BillEntity billEntity = new BillEntity();
		CustomerEntity customerEntity = customerRepository.findOne(dto.getIdCustomer());
		CategoryEntity categoryEntity = categoryRepository.findOne(dto.getCategoryId());
		if (dto.getId() != null) {
			BillEntity oldBill = billRepository.findOne(dto.getId());
			oldBill.setCategory(categoryEntity);
			oldBill.setCustomer(customerEntity);
			billEntity = billConverter.toEntity(oldBill, dto);
		} else {
			billEntity = billConverter.toEntity(dto);
			billEntity.setCustomer(customerEntity);
			billEntity.setCategory(categoryEntity);
			billEntity.setStatus((long) 1);
		}
		return billConverter.toDto(billRepository.save(billEntity));
	}
	
	@Override
	@Transactional
	public void delete(long id) {
		BillEntity oldBill = billRepository.findOne(id);
		oldBill.setStatus((long) 0);
		billRepository.save(oldBill);
		
	}

	@Override
	public List<BillDto> findByStatusAndDate(Long year) {
		List<BillDto> models = new ArrayList<>();
		List<BillEntity> entities = billRepository.findByStatusAndDate((long) SystemConstant.ACTIVE_STATUS,year);
		for (BillEntity item: entities) {
			BillDto billDTO = billConverter.toDto(item);
			models.add(billDTO);
		}
		return models;
	}

	@Override
	public List<BillDto> findByStatusAndDate(Long year, Long month) {
		List<BillDto> models = new ArrayList<>();
		List<BillEntity> entities = billRepository.findByStatusAndDate((long) SystemConstant.ACTIVE_STATUS, year, month);
		for (BillEntity item: entities) {
			BillDto billDTO = billConverter.toDto(item);
			models.add(billDTO);
		}
		return models;
	}

	@Override
	public List<BillDto> findByStatusAndDate(Long year, Long month, Long day) {
		List<BillDto> models = new ArrayList<>();
		List<BillEntity> entities = billRepository.findByStatusAndDate((long) SystemConstant.ACTIVE_STATUS, year, month,day);
		for (BillEntity item: entities) {
			BillDto billDTO = billConverter.toDto(item);
			models.add(billDTO);
		}
		return models;
	}

	@Override
	public int getTotalRevenue(String time, Long year, Long month, Long day) {
		int sum=0;
		List<BillDto> models = new ArrayList<>();
		
		if (time == null) {
			models = findByStatusAndDate(year);
		}
		else if(time.equals("ngay")){
			models = findByStatusAndDate(year,month,day);
		}
		else if(time.equals("thang")){
			models = findByStatusAndDate(year,month);
				}
		else if(time.equals("nam")){
			models = findByStatusAndDate(year);
		}
		for(int i=0;i<models.size();i++) {
			sum+=Integer.parseInt(models.get(i).getMoney());
		}
		return sum;
	}

	@Override
	public int countByCustomerId(Long id) {
		int count = billRepository.countByCustomerId(id);
		return count;
	}
}
