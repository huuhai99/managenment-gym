package com.laptrinhjavaweb.api;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.laptrinhjavaweb.dto.CategoryDTO;
import com.laptrinhjavaweb.service.ICategoryService;


@RestController
@RequestMapping(value = "/api/category")
public class CategoryAPI {
	
	@Autowired
	private ICategoryService categoryService;

	@PostMapping
	public CategoryDTO saveCategory(@Valid @RequestBody CategoryDTO categoryDTO) {
		return categoryService.saveCategory(categoryDTO);
	}
//	@DeleteMapping
//	public void deleteCategory( @RequestBody CategoryDTO categoryDTO) {
//		categoryService.delteCategory(categoryDTO.getIds());
//	}
//	@PutMapping
//	public CategoryDTO updateCategory(@Valid @RequestBody CategoryDTO categoryDTO ) {
//		return categoryService.updateCategory(categoryDTO);
//		
//	}
}
