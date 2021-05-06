package com.laptrinhjavaweb.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.laptrinhjavaweb.dto.CardDTO;
import com.laptrinhjavaweb.service.CardService;

@Controller()
public class CardController {
	

	@Autowired
	private CardService cardService;

	@RequestMapping(value = "/card", method = RequestMethod.GET)
	public ModelAndView cardPage() {
		ModelAndView mav = new  ModelAndView("admin/cardList");
		List<CardDTO> lisDtos = cardService.findAll();
		mav.addObject("cards", lisDtos);
		return mav;
	}
	
	@RequestMapping(value = "/editCard", method = RequestMethod.GET)
	public ModelAndView editCardPage() {
		ModelAndView mav = new ModelAndView("admin/editCard");
		return mav;
	}
	
	
}
