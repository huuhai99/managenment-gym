package com.laptrinhjavaweb.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.laptrinhjavaweb.Enums.StatusEnum;
import com.laptrinhjavaweb.converter.CategoryConverter;
import com.laptrinhjavaweb.dto.CategoryDTO;
import com.laptrinhjavaweb.entity.CategoryEntity;
import com.laptrinhjavaweb.repository.CategoryRepository;
import com.laptrinhjavaweb.service.ICategoryService;



@Service
public class CategoryServiceImpl implements ICategoryService {
	
	@Autowired
	private CategoryRepository categoryRepository;

	@Autowired
	private CategoryConverter categoryConverter;
	
	@Override
	@Transactional
	public CategoryDTO saveCategory(CategoryDTO categoryDTO) {
		CategoryEntity categoryEntity = categoryRepository.save(categoryConverter.converterToEntity(categoryDTO));
		categoryDTO = categoryConverter.converterToDTO(categoryEntity);
		return categoryDTO;
	}

	@Override
	public Map<String, String> getStatus() {
		Map<String, String> status = new HashMap<>();
		for (StatusEnum item : StatusEnum.values()) {
			status.put(item.toString(), item.getStatusValue());
		}
		return status;
	}
	@Override
	public Map<Long, String> findAll() {
		Map<Long, String> result = new HashMap<>();
		List<CategoryEntity> entities = categoryRepository.findAll();
		for (CategoryEntity item: entities) {
			result.put(item.getId(), item.getName());
		}
		return result;
	}

	@Override
	public List<CategoryDTO> finAll() {
		List<CategoryEntity> categoryEntity = categoryRepository.findAll();
		List<CategoryDTO> dtos = new ArrayList<>();
		for (CategoryEntity item : categoryEntity) {
			CategoryDTO categoryDTO = categoryConverter.converterToDTO(item);
			dtos.add(categoryDTO);
		}
		return dtos;
	}

}
