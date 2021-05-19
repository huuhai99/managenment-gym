package com.laptrinhjavaweb.controller.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.laptrinhjavaweb.dto.BillDto;
import com.laptrinhjavaweb.dto.MyUser;
import com.laptrinhjavaweb.service.IBillService;
import com.laptrinhjavaweb.service.ICategoryService;
import com.laptrinhjavaweb.util.MessageUtil;
import com.laptrinhjavaweb.util.SecurityUtils;

@Controller
public class BillsController {
	@Autowired
	private IBillService billService;
	
	@Autowired
	private ICategoryService categoryService;
	
	@Autowired
	private MessageUtil messageUtil;

	@RequestMapping(value = "/danh-sach-hoa-don", method = RequestMethod.GET)
	public ModelAndView billsPage() {
		ModelAndView mav = new ModelAndView("admin/list-bills");
		BillDto model = new BillDto();
		MyUser myUser = SecurityUtils.getPrincipal();
		Long idUser ;
		if (myUser == null) {
			idUser = null;
		}else {
			idUser = myUser.getId();
		}
		mav.addObject("userId", idUser);
		
		model.setListResult(billService.findAll());
		mav.addObject("model", model);
		return mav;
	}
	@RequestMapping(value = "/them-hoa-don", method = RequestMethod.GET)
	public ModelAndView addUserPage(@RequestParam(value = "id", required = false) Long id, HttpServletRequest request){
		ModelAndView mav = new ModelAndView("admin/add-bill");
		BillDto model = new BillDto();
		if (id != null) {
			model = billService.findById(id);
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
		mav.addObject("categories", categoryService.findAll());
		return mav;
	}
}
