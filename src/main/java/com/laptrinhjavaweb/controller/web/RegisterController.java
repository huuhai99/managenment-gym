package com.laptrinhjavaweb.controller.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.laptrinhjavaweb.entity.UserEntity;

@Controller(value = "registerControllerOfWeb")
public class RegisterController {

	@RequestMapping(value = "/dang-ky", method = RequestMethod.GET)
	public ModelAndView registerPage(Model model) {
		model.addAttribute("userForm", new UserEntity());
		ModelAndView mav = new ModelAndView("register");
		return mav;
	}
	
//	@RequestMapping(value = "/confirm", method = RequestMethod.GET)
//	public ModelAndView confirmPage() {
//		ModelAndView mav = new ModelAndView("confirm");
//		return mav;
//	}
	
	
	
	
	
}
