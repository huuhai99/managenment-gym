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

	
//	@Autowired
//	private  SessionFactory sessionFactory;
//	
//	@SuppressWarnings("unchecked")
//	@Override
//	public List<CardDTO> findAllCalander() {
//		List<CardDTO> list = null;
//		Session session = null;
//			Transaction transaction = null;
//			
//		try {
//			session = sessionFactory.openSession();
//			transaction = session.beginTransaction();
//			list = session.createQuery("select e.id as id, " 
//					+ "e.status as title, "
//					+ "DATE_FORMAT(e.startDate,'%y-%m-%d') as start, "
//					+ "DATE_FORMAT(e.endDate,'%y-%m-%d') as end"
//					+ "form card e")
//					.setResultTransformer(Transformers.aliasToBean(CardDTO.class))
//					.list();
//			
//			transaction.commit();
//		} catch (Exception e) {
//			list = null;
//			if(transaction != null) {
//				transaction.rollback();
//			}
//		}finally {
//			session.close();
//			
//		}
//		return list;
//	}

}
