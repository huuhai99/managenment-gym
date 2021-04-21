package com.laptrinhjavaweb.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BillsController {

	@RequestMapping(value = "/danh-sach-hoa-don", method = RequestMethod.GET)
	public ModelAndView billsPage() {
		ModelAndView mav = new ModelAndView("admin/list-bills");
		return mav;
	}
	
}
