package com.iiiedu.beauty.cart.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.iiiedu.beauty.model.Cart;

public interface CartRepository extends JpaRepository<Cart,Integer> {

}
