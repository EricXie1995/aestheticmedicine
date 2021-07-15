package com.iiiedu.beauty.cart.Service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iiiedu.beauty.cart.Service.CartService;
import com.iiiedu.beauty.cart.dao.CartRepository;
import com.iiiedu.beauty.model.Cart;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	private CartService cartService;
	@Autowired
	private CartRepository cartRepository;
	@Override
	public Cart addCart(Cart cart) {
		// TODO Auto-generated method stub
		return this.cartRepository.save(cart);
	}

	@Override
	public void delete(int productId) {
		// TODO Auto-generated method stub
		cartService.delete(productId);
	}

	@Override
	public List<Cart> findAll() {
		// TODO Auto-generated method stub
		return this.cartRepository.findAll();
	}

//	@Autowired
//	private CartDao cartDao;
//	
//	@Override
//	public Cart getCart(int memberPkId, int productId) {
//		// TODO Auto-generated method stub
//		return cartDao.getCart(memberPkId, productId);
//	}
//
//	@Override
//	public void addCart(Cart cart) {
//		// TODO Auto-generated method stub
//		cartDao.addCart(cart);
//	}
//
//	@Override
//	public boolean deleteCart(int memberPkId, int productId) {
//		// TODO Auto-generated method stub
//		return cartDao.deleteById(memberPkId);
//	}
//
//	@Override
//	public boolean updateCart(Cart cart) {
//		// TODO Auto-generated method stub
//		return cartDao.updateCart(cart);
//	}

}
