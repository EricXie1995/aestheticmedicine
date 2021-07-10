package com.iiiedu.beauty.cart;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.http.MediaType;


import com.iiiedu.beauty.cart.Service.CartService;
import com.iiiedu.beauty.model.Cart;
import com.iiiedu.beauty.model.Products;
import com.iiiedu.beauty.shopping.service.ProductsService;

@RestController
@RequestMapping(produces = MediaType.APPLICATION_JSON_VALUE)
public class CartController {

	@Autowired
	private ProductsService productsService;
	@Autowired
	private CartService cartService;
	
	@GetMapping("/showCart")
	public String showAllcart(Model model) {
		
		List<Products> list = productsService.getAllProducts();
		System.out.println(list);
		model.addAttribute("allProduct",list );
		return "cart/cart";
	}
	
//	@PostMapping("/addCart")
//	public Map<String, Object> addCart(int memberPkId, int productId, int counts){
//		
//		Cart cart = cartService.getCart(memberPkId, productId);
//		if(cart == null) {
//			
//			Cart cart1 = new Cart();
//			cart1.setMenberId(memberPkId);
//			cart1.setProductId(productId);
//			cart1.setProductPrice(productsService.get(productId).getProductPrice()*counts);
//			cart1.setCounts(counts);
//		} else {
//			
//			cart.setCounts(cart.getCounts()+counts);
//			cart.setProductPrice(productsService.get(productId).getProductPrice()*cart.getCounts());
//			cartService.updateCart(cart);
//		}
//		
//		Map<String, Object> resultMap = new HashMap<String, Object>();
//		resultMap.put("result", "success");
//		
//		return resultMap;
//	}
	
	@GetMapping("/cart/{cartId}")
    public Cart getCart(@PathVariable("cartId") int cartId) {
		Cart cart = new Cart();
		cart.setCartId(cartId);
		cart.setMemberPkId(10);
		cart.setProductPkId(20);
		cart.setCount(30);
		cart.setPrice(40);
		cart.setProductName("口罩");

        return cart;
    }
	
	@GetMapping("/add")
	public String showEmptyForm(Model model) {
		List<Cart> cart = new ArrayList<Cart>();
		cart.add(new Cart(1, 2, 3, 4, 5, "口罩"));
		cart.add(new Cart(2, 10, 20, 30, 40, "手套"));
		model.addAttribute("cart", cart);
		return "cart/Add";
	}
	
	
	
	
	
}
