package com.iiiedu.beauty.shopping.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iiiedu.beauty.model.Products;
import com.iiiedu.beauty.shopping.dao.ProductsRepository;
import com.iiiedu.beauty.shopping.service.ProductsService;

@Service
public class ProductsServiceImpl implements ProductsService {

	@Autowired
	private ProductsRepository productsRepository;

	@Override
	public List<Products> getAllProducts(){
		
		return productsRepository.findAll();
	}
	
	@Override
	public Products get(Integer id) {
		Optional<Products> optional = productsRepository.findById(id);
		Products products = null;
		if (optional.isPresent()) {
			products = optional.get();
		} else {
			throw new RuntimeException("Member(id=" + id + ")不存在");
		}
		return products;
	}
	
	@Override
	public void delete(Integer id) {
		productsRepository.deleteById(id);
	}
	
	@Override
	public Products save(Products products) {
		return productsRepository.save(products);
	}
}
