package com.laptrinhjavaweb.controller.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.laptrinhjavaweb.dto.JsonResultDto;
import com.laptrinhjavaweb.entity.UserEntity;
import com.laptrinhjavaweb.service.UserService;
import com.laptrinhjavaweb.service.impl.CustomUserDetailsService;
import com.laptrinhjavaweb.validator.UserValidator;

@Controller(value = "registerControllerOfWeb")
public class RegisterController {
	@Autowired
	private UserService userService;

	@Autowired
	private CustomUserDetailsService customeUserService;

	@Autowired
	private UserValidator userValidator;

	@RequestMapping(value = "/dang-ky", method = RequestMethod.GET)
	public ModelAndView registerPage(Model model) {
		model.addAttribute("userForm", new UserEntity());
		ModelAndView mav = new ModelAndView("register");
		return mav;
	}

	@RequestMapping(value = "/dang-ky", method = RequestMethod.POST)
	public ModelAndView registerPage(@ModelAttribute("userForm") UserEntity userForm, BindingResult bindingResult,
			Model model) {
		userValidator.validate(userForm, bindingResult);

		if (bindingResult.hasErrors()) {
			return new ModelAndView("register");
		}
		userForm.setStatus(1);
		userService.save(userForm);
		return new ModelAndView("redirect:/dang-nhap");
	}

	@PostMapping("/check")
	@ResponseBody
	public JsonResultDto<String> check(@RequestBody UserEntity userEntity) {
		if (userService.existsByUserName(userEntity.getUserName())) {
			return new JsonResultDto<String>().error("User name is exist");
		}
		return new JsonResultDto<String>().success("ok", null);
	}

	@PostMapping("/checkEmail")
	@ResponseBody
	public JsonResultDto<String> checkEmail(@RequestBody UserEntity entity) {
		if (userService.existsByEmail(entity.getEmail())) {
			return new JsonResultDto<String>().error("Email is register");
		}
		return new JsonResultDto<String>().success("ok", null);

	}
	@PostMapping("/checkPass")
	@ResponseBody
	public JsonResultDto<String> checkReaptPassword(@RequestBody UserEntity userEntity ){
		if(!userEntity.getPassword().equals(userEntity.getRepeatPass())) {
			return new JsonResultDto<String>().error("The password does not match");
		}
		return new JsonResultDto<String>().success("oke" , null);
	}
}
