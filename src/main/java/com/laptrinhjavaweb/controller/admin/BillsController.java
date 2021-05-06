package com.laptrinhjavaweb.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.laptrinhjavaweb.dto.BillDto;
import com.laptrinhjavaweb.service.IBillService;

@Controller
public class BillsController {
	@Autowired
	private IBillService billService;

	@RequestMapping(value = "/danh-sach-hoa-don", method = RequestMethod.GET)
	public ModelAndView billsPage() {
		ModelAndView mav = new ModelAndView("admin/list-bills");
		BillDto model = new BillDto();
		model.setListResult(billService.findAll());
		mav.addObject("model", model);
		return mav;
	}
	@RequestMapping(value = "/them-hoa-don", method = RequestMethod.GET)
	public ModelAndView addUserPage() {
		ModelAndView mav = new ModelAndView("admin/add-bill");
		return mav;
	}
}
