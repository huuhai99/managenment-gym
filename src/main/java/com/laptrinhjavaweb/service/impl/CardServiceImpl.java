package com.laptrinhjavaweb.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.modelmapper.ModelMapper;
import org.modelmapper.PropertyMap;
import org.modelmapper.config.Configuration.AccessLevel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.laptrinhjavaweb.converter.CardConverter;
import com.laptrinhjavaweb.dto.CardDTO;
import com.laptrinhjavaweb.entity.CardEntity;
import com.laptrinhjavaweb.entity.CustomerEntity;
import com.laptrinhjavaweb.entity.UserEntity;
import com.laptrinhjavaweb.repository.CardRepository;
import com.laptrinhjavaweb.repository.CustomerRepository;
import com.laptrinhjavaweb.repository.UserRepository;
import com.laptrinhjavaweb.service.CardService;
import com.laptrinhjavaweb.service.UserService;

@Service
public class CardServiceImpl implements CardService {
	
	@Autowired
	private CardRepository cardRepository;
	
	@Autowired
	private UserRepository usersRepository;
	
	@Autowired
	private CustomerRepository customerRepository;
	
	private CardConverter cardConverter = new CardConverter();

	@Override
	public List<CardDTO> findAll() {
		List<CardEntity> listCard = cardRepository.findAll();
		List<CardDTO> listdtos = new ArrayList<>();
		for (CardEntity item : listCard) {
			CustomerEntity customerEntity = item.getCustomerEntity();
			CardDTO cardDTO = cardConverter.converterToDTO(item);
			cardDTO.setNameCustomer(customerEntity.getFullName());
//			cardDTO.setNumberPhoneCustomer(customerEntity.getNumberPhone());
//			cardDTO.setNoteCustomer(customerEntity.getNote());
			listdtos.add(cardDTO);
		}
		return listdtos;
	}

	@Override
	@Transactional
	public CardDTO updateCard(CardDTO cardDTO) {
		CardEntity cardEntity = cardRepository.findOne(cardDTO.getId());
		ModelMapper modelMapper = new ModelMapper();
		modelMapper.getConfiguration().setFieldMatchingEnabled(true).setFieldAccessLevel(AccessLevel.PRIVATE);
		modelMapper.addMappings(new PropertyMap<CardDTO, CardEntity>() {
			@Override
			protected void configure() {
				skip(destination.getId());
				skip(destination.getCreatedBy());
				skip(destination.getCreatedDate());
				skip(destination.getModifiedBy());
				skip(destination.getModifiedDate());
			}
		});
		modelMapper.map(cardDTO, cardEntity);
		return cardConverter.converterToDTO(cardRepository.save(cardEntity));
	}

	@Override
	public CardDTO findById(Long id) {
		return cardConverter.converterToDTO(cardRepository.findOne(id));
	}

	@Override
	public List<CardDTO> findAllCalendar() {
		List<CardEntity> listCard = cardRepository.findAll();
		List<CardDTO> listdtos = new ArrayList<>();
		for (CardEntity item : listCard) {
			CustomerEntity customerEntity = item.getCustomerEntity();
			CardDTO cardDTO = cardConverter.converterToDTO(item);
			listdtos.add(cardDTO);
		}
		return listdtos;
	}

	@Override
	public CardDTO saveCalander(CardDTO cardDTO) {
		CardEntity cardEntity = cardConverter.converterToEntity(cardDTO);
		CardEntity entity = cardRepository.save(cardEntity);
		
		return cardConverter.converterToDTO(entity);
	}

	@Override
	public List<CardDTO> findByCustomer(Long id) {
		CustomerEntity customerEntity = customerRepository.findOne(id);
		List<CardEntity> listCard = cardRepository.findAll();
		List<CardDTO> list = new ArrayList<>();
		for (CardEntity item : listCard) {
			CustomerEntity entity = item.getCustomerEntity();
			CardDTO cardDTO = cardConverter.converterToDTO(item);
			cardDTO.setIdCustomer(entity.getId());
			if(cardDTO.getIdCustomer() == customerEntity.getId()) {
				list.add(cardDTO);
			}
		}
		return list;
	}


}
