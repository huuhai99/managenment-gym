package com.laptrinhjavaweb.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.laptrinhjavaweb.constant.SystemConstant;
import com.laptrinhjavaweb.entity.RoleEntity;
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
		userEntity.setPassword(bCyptPass.encode(userEntity.getPassword()));
		userEntity.setRoles(new ArrayList<>());

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

	
}
