package com.iiiedu.beauty.Paypal.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.iiiedu.beauty.Paypal.paypal.PayPalResult;
import com.iiiedu.beauty.Paypal.paypal.PayPalSucess;
import com.iiiedu.beauty.Paypal.service.PayPalService;
import com.iiiedu.beauty.model.PaypalProduct;

@Controller
@RequestMapping("cart")
public class CartController {

	@Autowired
	private PayPalService payPalService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String index(ModelMap modelMap) {
		List<PaypalProduct> paypalProduct = new ArrayList<PaypalProduct>();
		paypalProduct.add(new PaypalProduct("p01", "name 1", 2, 3));
		paypalProduct.add(new PaypalProduct("p02", "name 2", 4, 2));
		paypalProduct.add(new PaypalProduct("p03", "name 3", 5, 4));
		modelMap.put("products", paypalProduct);
		modelMap.put("payPalConfig", payPalService.getPayPalConfig());
		return "cart/index";
	}
	
	@RequestMapping(value="success", method = RequestMethod.GET)
	public String success(HttpServletRequest request) {
		PayPalSucess payPalSucess = new PayPalSucess();
		PayPalResult payPalResult = payPalSucess.getPayPal(request, payPalService.getPayPalConfig());
		System.out.println("Order Info");
		System.out.println("First Name: " + payPalResult.getFirst_name());
		System.out.println("Last Name: " + payPalResult.getLast_name());
		System.out.println("Country: " + payPalResult.getAddress_country());
		System.out.println("Email: " + payPalResult.getPayer_email());
		System.out.println("Gross: " + payPalResult.getMc_gross());
		return "cart/success";
	} 
	
}
