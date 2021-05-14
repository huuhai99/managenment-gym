package com.laptrinhjavaweb.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.laptrinhjavaweb.dto.CardDTO;
import com.laptrinhjavaweb.service.CardService;


@RestController
@RequestMapping(value = "/api/card")
public class CardApi {
	
	@Autowired
	private CardService cardService;
	
	@PutMapping
	public CardDTO updateCard(@RequestBody CardDTO cardDTO) {
		return cardService.updateCard(cardDTO);
	}
	@PostMapping
	public CardDTO saveCalendar(@RequestBody CardDTO cardDTO) {
		return cardService.saveCalander(cardDTO);
		
	}
	

}
