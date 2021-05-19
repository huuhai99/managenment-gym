package com.laptrinhjavaweb.controller.admin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.laptrinhjavaweb.dto.CustomerDto;
import com.laptrinhjavaweb.dto.MyUser;
import com.laptrinhjavaweb.service.ICustomerService;
import com.laptrinhjavaweb.service.UserService;
import com.laptrinhjavaweb.util.MessageUtil;
import com.laptrinhjavaweb.util.SecurityUtils;

@Controller
public class CustomersController {
	@Autowired
	private ICustomerService customerService;
	
	@Autowired
	private UserService userservice;
	
	@Autowired
	private MessageUtil messageUtil;

	@RequestMapping(value = "/danh-sach", method = RequestMethod.GET)
	public ModelAndView usersPage() {
		ModelAndView mav = new ModelAndView("admin/list-customers");
		CustomerDto model = new CustomerDto();
		model.setListResult(customerService.findByStatus());
		mav.addObject("model", model);
		return mav;
	}
	@RequestMapping(value = "/them-khach-hang", method = RequestMethod.GET)
	public ModelAndView addUserPage(@RequestParam(value = "id", required = false) Long id, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("admin/add-customer");
		CustomerDto model = new CustomerDto();
		if (id != null) {
			model = customerService.findById(id);
		}
		if (request.getParameter("message") != null) {
			Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
			mav.addObject("message", message.get("message"));
			mav.addObject("alert", message.get("alert"));
		}
		mav.addObject("model", model);
		return mav;
	}
	@RequestMapping(value = "/danh-sach-hoc-vien/{id}", method = RequestMethod.GET)
		public ModelAndView listStudent(@PathVariable Long id) {
			ModelAndView mav = new ModelAndView("admin/listStudent");
			List<CustomerDto> lists = customerService.findByIdUser(id);
			
			mav.addObject("customers", lists);
			return mav;
		}
	
	
}
