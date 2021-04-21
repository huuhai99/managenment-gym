package com.laptrinhjavaweb.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller(value = "homeControllerOfAdmin")
public class HomeController {

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public ModelAndView homePage() {
		ModelAndView mav = new ModelAndView("admin/home");
		return mav;
	}
	@RequestMapping(value = "/card", method = RequestMethod.GET)
	public ModelAndView cardPage() {
		ModelAndView mav = new ModelAndView("admin/cardList");
		return mav;
	}
	
	@RequestMapping(value = "/editCard", method = RequestMethod.GET)
	public ModelAndView editCardPage() {
		ModelAndView mav = new ModelAndView("admin/editCard");
		return mav;
	}
}
