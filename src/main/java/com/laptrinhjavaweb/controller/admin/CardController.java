package com.laptrinhjavaweb.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.laptrinhjavaweb.dto.CardDTO;
import com.laptrinhjavaweb.service.CardService;
import com.laptrinhjavaweb.service.ICustomerService;



@Controller
public class CardController {
	

	@Autowired
	private CardService cardService;
	
	@Autowired
	private ICustomerService customerService;

	@RequestMapping(value = "/card", method = RequestMethod.GET)
	public ModelAndView cardPage() {
		ModelAndView mav = new  ModelAndView("admin/cardList");
		List<CardDTO> lisDtos = cardService.findAll();
		mav.addObject("cards", lisDtos);
		return mav;
	}
	
	@RequestMapping(value = "/editCard/{id}", method = RequestMethod.GET)
	public ModelAndView editCardPage(@PathVariable("id") Long id) {
		ModelAndView mav = new ModelAndView("admin/editCard");
		mav.addObject("customerId" , customerService.findAll());
		CardDTO cardDTO  = cardService.findById(id);
		mav.addObject("card",cardDTO);
		return mav;
	}
	
	@RequestMapping(value = "/findAll" , method = RequestMethod.GET ,produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String findAll() {
		Gson gson = new Gson();	
		return gson.toJson(cardService.findAllCalendar());
	}

	@RequestMapping(value = "/attendance", method = RequestMethod.GET)
	public ModelAndView addUserPage() {
		ModelAndView mav = new ModelAndView("admin/calander");
		return mav;
	}

}
