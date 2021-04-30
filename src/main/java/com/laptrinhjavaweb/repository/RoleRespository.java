package com.laptrinhjavaweb.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.laptrinhjavaweb.entity.RoleEntity;

public interface RoleRespository extends JpaRepository<RoleEntity, Long> {

}
