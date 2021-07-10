package com.iiiedu.beauty.shopping.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.iiiedu.beauty.model.Products;

public interface ProductsRepository extends JpaRepository<Products, Integer> {

}
