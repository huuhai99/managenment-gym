package com.laptrinhjavaweb.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.laptrinhjavaweb.converter.CardConverter;
import com.laptrinhjavaweb.dto.CardDTO;
import com.laptrinhjavaweb.entity.CardEntity;
import com.laptrinhjavaweb.entity.CustomerEntity;
import com.laptrinhjavaweb.repository.CardRepository;
import com.laptrinhjavaweb.service.CardService;

@Service
public class CardServiceImpl implements CardService {
	
	@Autowired
	private CardRepository cardRepository;
	
	private CardConverter cardConverter = new CardConverter();

	@Override
	public List<CardDTO> findAll() {
		List<CardEntity> listCard = cardRepository.findAll();
		List<CardDTO> listdtos = new ArrayList<>();
		for (CardEntity item : listCard) {
			CustomerEntity customerEntity = item.getCustomerEntity();
			CardDTO cardDTO = cardConverter.converterToDTO(item);
			cardDTO.setNameCustomer(customerEntity.getFullName());
			cardDTO.setNumberPhone(customerEntity.getNumberphone());
			listdtos.add(cardDTO);
		}
		return listdtos;
	}

}
