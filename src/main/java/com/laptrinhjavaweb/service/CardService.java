package com.laptrinhjavaweb.service;

import java.util.List;

import com.laptrinhjavaweb.dto.CardDTO;

public interface CardService {
	public List<CardDTO> findAll();
	public CardDTO updateCard(CardDTO cardDTO);
	public CardDTO findById(Long id);
	public List<CardDTO> findAllCalendar();
	public CardDTO saveCalander(CardDTO cardDTO);
}
