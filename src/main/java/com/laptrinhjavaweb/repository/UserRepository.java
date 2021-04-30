package com.laptrinhjavaweb.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.laptrinhjavaweb.entity.UserEntity;

@Repository
public interface UserRepository extends JpaRepository<UserEntity, Long> {
	UserEntity findOneByUserNameAndStatus(String name, int status);
	
	boolean existsByUserName(String userName);
	
	boolean existsByEmail(String email);
	
	boolean findByPassword(@Param("password") boolean password);
	
	
	
}
