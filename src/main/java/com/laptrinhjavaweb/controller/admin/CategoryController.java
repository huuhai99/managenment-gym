package com.laptrinhjavaweb.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.laptrinhjavaweb.service.ICategoryService;


@Controller
public class CategoryController {
	
	@Autowired
	private ICategoryService iCategoryService;
	
	@RequestMapping(value = "/danh-sach-the-loai", method = RequestMethod.GET)
	public ModelAndView categoryPage() {
		ModelAndView mav = new ModelAndView("admin/category");
		return mav;
	}
	
	@RequestMapping(value = "/them-the-loai", method = RequestMethod.GET)
	public ModelAndView saveCategoryPage() {
		ModelAndView mav = new ModelAndView("admin/categoryedit");
		mav.addObject("status", iCategoryService.getStatus());
		return mav;
	}
	

}
