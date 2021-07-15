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
import com.iiiedu.beauty.cart.dao.CartRepository;
import com.iiiedu.beauty.model.Cart;
import com.iiiedu.beauty.model.Products;
import com.iiiedu.beauty.model.showCartModel;
import com.iiiedu.beauty.shopping.service.ProductsService;

@Controller
@RequestMapping("/cart")
public class CartAction {

	@Autowired
	private ProductsService productsService;
	@Autowired
	private CartService cartService;
	@Autowired
	private CartRepository cartRepository;
	
	@GetMapping("/showCart")
	public String showAllcart(Model model) {
		
		List<Cart> list = cartService.findAll();
		List<showCartModel> models = new ArrayList<>();
		for(Cart cart : list) {
			Products product = this.productsService.get(cart.productPkId);
			if(product!=null) {
				showCartModel sm = new showCartModel();
				sm.cartId = cart.cartId;
				sm.count = cart.count;
				sm.memberPkId = cart.memberPkId;
				sm.price = cart.price;
				sm.productName = cart.productName;
				sm.image = product.getImage();
				sm.productSpec = product.getProductSpec();

				models.add(sm);
			}
		}
		
		for(showCartModel sc :models) {
			System.out.println(sc.productName);

		}
		model.addAttribute("showCartModel",models );
		return "cart/cart";
	}
}
