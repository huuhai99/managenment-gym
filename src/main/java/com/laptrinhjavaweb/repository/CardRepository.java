package com.laptrinhjavaweb.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.laptrinhjavaweb.dto.CardDTO;
import com.laptrinhjavaweb.entity.CardEntity;

@Repository
public interface CardRepository extends JpaRepository<CardEntity, Long> {

}
