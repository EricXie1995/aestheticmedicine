package com.iiiedu.beauty.cart.Service;

import java.util.List;

import com.iiiedu.beauty.model.Cart;

public interface CartService {
 	
//	void addCart(int memberPkId, int productId, int counts);
//	
//	void updateCart(Cart cart);
//
//	boolean deleteCart(int memberPkId , int productId);
	
	 
    Cart addCart(Cart cart);
   
    void delete(int productId);

    List<Cart> findAll();
    
	
}
