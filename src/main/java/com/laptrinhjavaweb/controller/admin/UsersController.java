package com.laptrinhjavaweb.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UsersController {

	@RequestMapping(value = "/danh-sach", method = RequestMethod.GET)
	public ModelAndView usersPage() {
		ModelAndView mav = new ModelAndView("admin/list-users");
		return mav;
	}
	
}
