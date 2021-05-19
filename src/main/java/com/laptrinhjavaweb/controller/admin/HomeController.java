package com.laptrinhjavaweb.controller.admin;

import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.laptrinhjavaweb.constant.SystemConstant;
import com.laptrinhjavaweb.dto.JsonResultDto;
import com.laptrinhjavaweb.dto.MyUser;
import com.laptrinhjavaweb.dto.ThongKeDto;
import com.laptrinhjavaweb.entity.UserEntity;
import com.laptrinhjavaweb.service.ICustomerService;
import com.laptrinhjavaweb.service.UserService;
import com.laptrinhjavaweb.service.impl.CustomUserDetailsService;
import com.laptrinhjavaweb.service.impl.EmailService;
import com.laptrinhjavaweb.util.SecurityUtils;
import com.laptrinhjavaweb.validator.UserValidator;


@Controller( value = "homeControllerOfAdmin")
public class HomeController {
	
	@Autowired
	private UserService userService;

	@Autowired
	private CustomUserDetailsService customeUserService;

	@Autowired
	private UserValidator userValidator;
	
	@Autowired
	private EmailService emailService;
	
	@Autowired
	private BCryptPasswordEncoder bCyptPass;
	
	@Autowired
	private ICustomerService customerService;
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public ModelAndView homePage(@RequestParam(value = "time", required = false) String time) {
		ModelAndView mav = new ModelAndView("admin/home");
		MyUser myUser = SecurityUtils.getPrincipal();
		Long idUser ;
		if (myUser == null) {
			idUser = null;
		}else {
			idUser = myUser.getId();
		}
		mav.addObject("userId", idUser);
		ThongKeDto thongKe = new ThongKeDto();
		thongKe.setTotalCustomer((int)customerService.getTotalCustomer());
		thongKe.setMaleCustomer((int)customerService.getTotalMaleCustomer());
		thongKe.setFemaleCustomer((int)customerService.getTotalFemaleCustomer());
		mav.addObject("thongke", thongKe);
		if (time == null) {
			thongKe.setTotalCustomer((int)customerService.getTotalCustomer());
			thongKe.setMaleCustomer((int)customerService.getTotalMaleCustomer());
			thongKe.setFemaleCustomer((int)customerService.getTotalFemaleCustomer());
			mav.addObject("thongke", thongKe);
		}
		else if(time.equals("ngay")){
			thongKe.setTotalCustomer(2);
			thongKe.setMaleCustomer(1);
			thongKe.setFemaleCustomer(1);
			mav.addObject("thongke", thongKe);
		}
		else if(time.equals("thang")){
			thongKe.setTotalCustomer(3);
			thongKe.setMaleCustomer(2);
			thongKe.setFemaleCustomer(1);
			mav.addObject("thongke", thongKe);
				}
		else if(time.equals("nam")){
			thongKe.setTotalCustomer(4);
			thongKe.setMaleCustomer(2);
			thongKe.setFemaleCustomer(2);
			mav.addObject("thongke", thongKe);
		}
		else if(time.equals("quy")){
			thongKe.setTotalCustomer(5);
			thongKe.setMaleCustomer(2);
			thongKe.setFemaleCustomer(3);
			mav.addObject("thongke", thongKe);
				}
		return mav;
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView loginPage() {
		ModelAndView mav = new ModelAndView("login");
		return mav;
	}

	@RequestMapping(value = "/thoat", method = RequestMethod.GET)
	public ModelAndView logoutPage(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return new ModelAndView("redirect:/dang-nhap");
	}

	@RequestMapping(value = "/accessDenied", method = RequestMethod.GET)
	public ModelAndView accessDenied() {
		return new ModelAndView("redirect:/dang-nhap?accessDenied");
	}
	
	@RequestMapping(value = "/verifyEmail", method = RequestMethod.GET)
	public ModelAndView registerPage() {
		ModelAndView mav = new ModelAndView("verifyEmail");
		return mav;
	}
	
	@RequestMapping(value = "/email", method = RequestMethod.GET)
	public ModelAndView emailPage() {
		ModelAndView mav = new ModelAndView("checkEmail");
		return mav;
	}
	
	// UUID(Universally Unique IDentifier)
	@RequestMapping(value = "/register" , method = {RequestMethod.POST} )
	public ModelAndView  register( @RequestBody UserEntity entity , ModelAndView mav) {
	
		entity.setPassword(bCyptPass.encode(entity.getPassword()));
		entity.setStatus(SystemConstant.INACTIVE_STATUS);
		entity.setConfirmToken(UUID.randomUUID().toString());
		userService.save(entity);
		
		SimpleMailMessage reMailMessage = new SimpleMailMessage();
		reMailMessage.setTo(entity.getEmail());
		reMailMessage.setSubject("Confirm Your Email Here");
		reMailMessage.setText("To confirm your email, please click the link below: "
					+ "http://localhost:8080/spring-mvc/confirm?token=" + entity.getConfirmToken());
		reMailMessage.setFrom("noreplymobileshop@gmail.com");
		emailService.sendEmail(reMailMessage);
		
		mav.addObject("confirmationMessage" ,"A confirmation e-mail has been sent to " + entity.getEmail());
		mav.setViewName("verifyEmail");
		
		return mav;
		
	}
	
	@RequestMapping(value = "/confirm" , method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView comfirmRegister(ModelAndView mav , @RequestParam("token") String token) {
		
		UserEntity userToken = userService.findByConfirmToken(token);
		
		if(userToken != null) {
			UserEntity entity = userService.findByConfirmToken(token);
			entity.setStatus(SystemConstant.ACTIVE_STATUS);
			userService.save(entity);
			mav.addObject("confirmationToken" , userToken.getConfirmToken());
			
		}else {
			mav.addObject("invalidToken" , "No confirm email");
		}
		mav.setViewName("confirm");
		
		return mav;
		
	}
	
	@RequestMapping(value = "/sendMail", method = { RequestMethod.POST })
	public ModelAndView sendMail(UserEntity entity, ModelAndView mav) {

		UserEntity findEmail = userService.findByEmail(entity.getEmail());

		SimpleMailMessage reMailMessage = new SimpleMailMessage();
		reMailMessage.setTo(entity.getEmail());
		reMailMessage.setSubject("Confirm Your Email Here");
		reMailMessage.setText("To confirm your email, please click the link below: "
				+ "http://localhost:8080/spring-mvc/forgotpass?token=" + findEmail.getConfirmToken());
		reMailMessage.setFrom("noreplymobileshop@gmail.com");
		emailService.sendEmail(reMailMessage);
		mav.setViewName("verifyEmailPassword");

		return mav;

	}

	@RequestMapping(value = "/forgotpass", method = RequestMethod.GET)
	public ModelAndView getToken(@RequestParam("token") String token, ModelAndView mav) {
		UserEntity userToken = userService.findByConfirmToken(token);
		mav.addObject("token", userToken);
		mav.setViewName("forgotpassword");
		return mav;
	}

	@RequestMapping(value = "/forgotpass", method = { RequestMethod.POST })
	public ModelAndView resetPass(@RequestParam("confirmToken") String token, @RequestParam("password") String password, ModelAndView mav) {
		UserEntity userToken = userService.findByConfirmToken(token);
		System.out.println(token);
		if (userToken != null) {
			UserEntity entity = userService.findByConfirmToken(token);
			entity.setPassword(bCyptPass.encode(password));
			userService.save(entity);
			mav.addObject("confirmationToken", userToken.getConfirmToken());
			mav.setViewName("login");
		} else {
			mav.addObject("invalidToken", "No confirm email");
		}

		return mav;

	}

	@PostMapping("/check")
	@ResponseBody
	public JsonResultDto<String> check(@RequestBody UserEntity userEntity) {
		if (userService.existsByUserName(userEntity.getUserName())) {
			return new JsonResultDto<String>().error("Tên đăng nhập đã tồn tại");
		}
		return new JsonResultDto<String>().success("Hợp lệ", null);
	}

	@PostMapping("/checkEmail")
	@ResponseBody
	public JsonResultDto<String> checkEmail(@RequestBody UserEntity entity) {
		if (userService.existsByEmail(entity.getEmail())) {
			return new JsonResultDto<String>().error("Email đã được đăng ký");
		}
		return new JsonResultDto<String>().success("Hợp lệ", null);

	}
	@PostMapping("/checkPass")
	@ResponseBody
	public JsonResultDto<String> checkReaptPassword(@RequestBody UserEntity userEntity ){
		if(!userEntity.getPassword().equals(userEntity.getRepeatPass())) {
			return new JsonResultDto<String>().error("The password does not match");
		}
		return new JsonResultDto<String>().success("oke" , null);
	}
	
	// check email bên form xác nhận email
		@PostMapping("/checkEmail1")
		@ResponseBody
		public JsonResultDto<String> checkEmail1(@RequestBody UserEntity entity) {
			if (userService.existsByEmail(entity.getEmail())) {
				return new JsonResultDto<String>().error("");
			}
			return new JsonResultDto<String>().success("Email chưa được đăng ký", null);

		}

}
