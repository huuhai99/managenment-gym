package com.laptrinhjavaweb.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CategoryController {
	
	@RequestMapping(value = "/danh-sach-the-loai", method = RequestMethod.GET)
	public ModelAndView billsPage() {
		ModelAndView mav = new ModelAndView("admin/category");
		
		return mav;
	}

}
