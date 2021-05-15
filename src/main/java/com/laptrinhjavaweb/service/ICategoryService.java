package com.laptrinhjavaweb.service;

import java.util.Map;

import com.laptrinhjavaweb.dto.CategoryDTO;

public interface ICategoryService {
	public CategoryDTO saveCategory(CategoryDTO categoryDTO);
	Map<String,String> getStatus();

}
