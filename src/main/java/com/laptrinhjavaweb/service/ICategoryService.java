package com.laptrinhjavaweb.service;

import java.util.List;
import java.util.Map;

import com.laptrinhjavaweb.dto.CategoryDTO;

public interface ICategoryService {
	public CategoryDTO saveCategory(CategoryDTO categoryDTO);
	Map<String,String> getStatus();
	Map<Long, String> findAll();
	public List<CategoryDTO> finAll();

}
