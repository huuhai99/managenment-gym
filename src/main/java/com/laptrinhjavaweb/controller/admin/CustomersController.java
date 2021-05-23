package com.laptrinhjavaweb.controller.admin;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.laptrinhjavaweb.dto.BillDto;
import com.laptrinhjavaweb.dto.CustomerDto;
import com.laptrinhjavaweb.dto.JsonResultDto;
import com.laptrinhjavaweb.dto.MyUser;
import com.laptrinhjavaweb.entity.CustomerEntity;
import com.laptrinhjavaweb.service.IBillService;
import com.laptrinhjavaweb.service.ICustomerService;
import com.laptrinhjavaweb.service.UserService;
import com.laptrinhjavaweb.util.MessageUtil;
import com.laptrinhjavaweb.util.SecurityUtils;

@Controller
public class CustomersController {
	@Autowired
	private ICustomerService customerService;
	
	@Autowired
	private IBillService billService;
	
	@Autowired
	private UserService userservice;
	
	@Autowired
	private MessageUtil messageUtil;

	@RequestMapping(value = "/danh-sach", method = RequestMethod.GET)
	public ModelAndView usersPage(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("admin/list-customers");
		CustomerDto model = new CustomerDto();
		if (request.getParameter("message") != null) {
			Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
			mav.addObject("message", message.get("message"));
			mav.addObject("alert", message.get("alert"));
		}
		MyUser myUser = SecurityUtils.getPrincipal();
		Long idUser ;
		if (myUser == null) {
			idUser = null;
		}else {
			idUser = myUser.getId();
		}
		mav.addObject("userId", idUser);
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
		
		MyUser myUser = SecurityUtils.getPrincipal();
		Long idUser ;
		if (myUser == null) {
			idUser = null;
		}else {
			idUser = myUser.getId();
		}
		mav.addObject("userId", idUser);
		mav.addObject("model", model);
		return mav;
	}
	@RequestMapping(value = "/thong-tin-khach-hang", method = RequestMethod.GET)
	public ModelAndView infoUserPage(@RequestParam(value = "id", required = false) Long id, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("admin/info-customer");
		CustomerDto model = new CustomerDto();
		List<BillDto> listBill = new ArrayList<BillDto>();
		if (id != null) {
			model = customerService.findById(id);
			listBill = billService.findByCustomerId(id);
		}
		MyUser myUser = SecurityUtils.getPrincipal();
		Long idUser ;
		if (myUser == null) {
			idUser = null;
		}else {
			idUser = myUser.getId();
		}
		mav.addObject("userId", idUser);
		mav.addObject("model", model);
		return mav;
	}
	@RequestMapping(value = "/danh-sach-hoc-vien/{id}", method = RequestMethod.GET)
		public ModelAndView listStudent(@PathVariable Long id) {
			ModelAndView mav = new ModelAndView("admin/listStudent");
			List<CustomerDto> lists = customerService.findByIdUser(id);
			
			MyUser myUser = SecurityUtils.getPrincipal();
			Long idUser ;
			if (myUser == null) {
				idUser = null;
			}else {
				idUser = myUser.getId();
			}
			mav.addObject("userId", idUser);
			mav.addObject("customers", lists);
			return mav;
		}
	
	@PostMapping("/checkFullName")
	@ResponseBody
	public JsonResultDto<String> check(@RequestBody CustomerEntity customerEntity) {
		if (customerService.existsByUserName(customerEntity.getFullName())) {
			return new JsonResultDto<String>().error("Hợp lệ");
		}
		return new JsonResultDto<String>().success("Tên không tồn tại", null);
	}
}
