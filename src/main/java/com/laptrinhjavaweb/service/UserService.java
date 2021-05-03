package com.laptrinhjavaweb.service;

import com.laptrinhjavaweb.entity.UserEntity;

public interface UserService {
	void save(UserEntity userEntity);
	
	
	
	UserEntity findByEmail(String email);
	
	UserEntity findOneByUsernameAndActive(String username, int status);
	
	UserEntity findByConfirmToken(String confirmToken);

	UserEntity findByUsername(String username);

	boolean existsByUserName(String userName);
	
	boolean existsByEmail(String email);
	
	boolean findByPassword(boolean password);
	
	
	
}
