package com.laptrinhjavaweb.service.impl;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.laptrinhjavaweb.dto.BillDto;
import com.laptrinhjavaweb.entity.BillEntity;
import com.laptrinhjavaweb.repository.BillRepository;
import com.laptrinhjavaweb.service.IBillService;

@Service
public class BillServiceImpl implements IBillService {

	@Autowired
	private BillRepository billRepository;
	
	@Override
	public List<BillDto> findAll() {
		List<BillDto> models = new ArrayList<>();
		List<BillEntity> entities = billRepository.findAll();
		for (BillEntity item: entities) {
			BillDto billDTO = new BillDto();
			billDTO.setId(item.getId());
			billDTO.setIdCustomer(item.getCustomer().getId());
			billDTO.setContent(item.getContent());
			billDTO.setMoney(item.getMoney());
			billDTO.setCreatedDate(dateToTimestamp(item.getCreatedDate()));
			billDTO.setCreatedBy((item.getCreatedBy()));
			billDTO.setModifiedDate(dateToTimestamp(item.getModifiedDate()));
			billDTO.setModifiedBy(item.getModifiedBy());
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
	
	
	
	


	
}
