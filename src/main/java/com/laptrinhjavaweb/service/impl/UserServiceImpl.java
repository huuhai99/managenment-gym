package com.laptrinhjavaweb.service.impl;

import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.laptrinhjavaweb.constant.SystemConstant;
import com.laptrinhjavaweb.entity.UserEntity;
import com.laptrinhjavaweb.repository.RoleRespository;
import com.laptrinhjavaweb.repository.UserRepository;
import com.laptrinhjavaweb.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserRepository userRespository;

	@Autowired
	private RoleRespository roleRespository;

	@Autowired
	private BCryptPasswordEncoder bCyptPass;

	@Override
	public void save(UserEntity userEntity) {
		userEntity.setEmail(userEntity.getEmail());
		userEntity.setFullName(userEntity.getFullName());
		userEntity.setUserName(userEntity.getUserName());
		userEntity.setRoles(Arrays.asList(roleRespository.findByCode("USER")));
		

		userRespository.save(userEntity);

	}

	@Override
	public UserEntity findByUsername(String username) {
		return userRespository.findOneByUserNameAndStatus(username, SystemConstant.ACTIVE_STATUS);
	}

	@Override
	public boolean existsByUserName(String userName) {
		return userRespository.existsByUserName(userName);
	}

	@Override
	public boolean existsByEmail(String email) {
		return userRespository.existsByEmail(email);
	}

	@Override
	public boolean findByPassword(boolean password) {
		return userRespository.findByPassword(password);
	}

	@Override
	public UserEntity findByEmail(String email) {
		return userRespository.findByEmail(email);
	}

	@Override
	public UserEntity findOneByUsernameAndActive(String username, int status) {
		return userRespository.findOneByUserNameAndStatus(username, status);
	}

	@Override
	public UserEntity findByConfirmToken(String confirmToken) {
		return userRespository.findByConfirmToken(confirmToken);
	}


	
}
