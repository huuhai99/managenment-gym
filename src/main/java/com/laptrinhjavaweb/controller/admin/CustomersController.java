package com.laptrinhjavaweb.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.laptrinhjavaweb.dto.CustomerDto;
import com.laptrinhjavaweb.service.ICustomerService;

@Controller
public class CustomersController {
	@Autowired
	private ICustomerService customerService;

	@RequestMapping(value = "/danh-sach", method = RequestMethod.GET)
	public ModelAndView usersPage() {
		ModelAndView mav = new ModelAndView("admin/list-customers");
		CustomerDto model = new CustomerDto();
		model.setListResult(customerService.findAll());
		mav.addObject("model", model);
		return mav;
	}
	@RequestMapping(value = "/them-khach-hang", method = RequestMethod.GET)
	public ModelAndView addUserPage() {
		ModelAndView mav = new ModelAndView("admin/add-customer");
		return mav;
	}
	
}
