package com.iiiedu.beauty.shopping.service;

import java.util.List;

import com.iiiedu.beauty.model.Products;

public interface ProductsService {

	List<Products> getAllProducts();

	Products save(Products products);

	Products get(Integer id);

	void delete(Integer id);

	void update(Products products);

}