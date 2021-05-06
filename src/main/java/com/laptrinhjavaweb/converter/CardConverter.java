package com.laptrinhjavaweb.converter;

import org.modelmapper.ModelMapper;

import com.laptrinhjavaweb.dto.CardDTO;
import com.laptrinhjavaweb.entity.CardEntity;

public class CardConverter {
	public CardDTO converterToDTO(CardEntity cardEntity) {
		ModelMapper mapper = new ModelMapper();
		CardDTO cardDTO = mapper.map(cardEntity, CardDTO.class);
		return cardDTO;
		
	}
	public CardEntity converterToEntity(CardDTO cardDTO) {
		ModelMapper mapper = new ModelMapper();
		CardEntity cardEntity = mapper.map(cardDTO, CardEntity.class);
		return cardEntity;
		
	}

}
