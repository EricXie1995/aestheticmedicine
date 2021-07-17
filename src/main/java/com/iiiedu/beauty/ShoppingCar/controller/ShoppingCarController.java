package com.iiiedu.beauty.ShoppingCar.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.iiiedu.beauty.Paypal.service.PayPalService;
import com.iiiedu.beauty.ShoppingCar.service2.ProductService;
import com.iiiedu.beauty.ShoppingCar.service2.ShoppingCarService;
import com.iiiedu.beauty.ShoppingCar.service2.UserService;
import com.iiiedu.beauty.model.PaypalProduct;
import com.iiiedu.beauty.model.Product;
import com.iiiedu.beauty.model.ShoppingCar;
import com.iiiedu.beauty.model.UserMain;

/**
 * Created by 14437 on 2017/3/3.
 */
@Controller
@RequestMapping("/shoppingMall")
public class ShoppingCarController {
    @Resource
    private ProductService productService;
    @Resource
    private UserService userService;
    @Resource
    private ShoppingCarService shoppingCarService;

    @Autowired
	private PayPalService payPalService;
    
    @RequestMapping(value = "/shopping_car")
    public String shopping_car(ModelMap modelMap){
    	
//    	List<PaypalProduct> paypalProduct = new ArrayList<PaypalProduct>();
//		paypalProduct.add(new PaypalProduct("p01", "name 1", 2, 3));
//		paypalProduct.add(new PaypalProduct("p02", "name 2", 4, 2));
//		paypalProduct.add(new PaypalProduct("p03", "name 3", 5, 4));
//		modelMap.put("products", paypalProduct);
		modelMap.put("payPalConfig", payPalService.getPayPalConfig());
    	
        return "shoppingMall/shopping_car";
    }

    @RequestMapping(value = "/addShoppingCar",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> addShoppingCar(int userId,int productId,int counts){
        System.out.println("ID為"+productId);
        UserMain userMain = userService.getUser(userId);
        Product product = productService.getProduct(productId);
        System.out.println(userMain);
        System.out.println(product);
        ShoppingCar shoppingCar = shoppingCarService.getShoppingCar(userId, productId);
        System.out.println(shoppingCar);
        if(shoppingCar == null){
            ShoppingCar shoppingCar1 = new ShoppingCar();
            shoppingCar1.setUserMain(userMain);
            shoppingCar1.setProduct(product);
            shoppingCar1.setCounts(counts);
            shoppingCar1.setProductPrice(productService.getProduct(productId).getPrice()*counts);
            shoppingCarService.addShoppingCar(shoppingCar1);
        }
        else{
            shoppingCar.setCounts(shoppingCar.getCounts()+counts);
            shoppingCar.setProductPrice(productService.getProduct(productId).getPrice()*shoppingCar.getCounts());
            shoppingCarService.updateShoppingCar(shoppingCar);
        }
        Map<String, Object> resultMap = new HashMap<String,Object>();
        resultMap.put("result","success");
        System.out.println("我返回了");
        return resultMap;
    }

    @RequestMapping(value = "/getShoppingCars",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> getShoppingCars(int userId){
        List<ShoppingCar> shoppingCarList = shoppingCarService.getShoppingCars(userId);
//        System.out.println(shoppingCarList);
        String shoppingCars = JSONArray.toJSONString(shoppingCarList);
        Map<String,Object> resultMap = new HashMap<String,Object>();
        resultMap.put("result",shoppingCars);
        return resultMap;
    }

    @RequestMapping(value = "/deleteShoppingCar",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> deleteShoppingCar(int userId,int carId) {
//    	ShoppingCar shoppingCar = shoppingCarService.getShoppingCar(userId,carId);
    	shoppingCarService.deleteShoppingCar(carId);
        Map<String, Object> resultMap = new HashMap<String,Object>();
        resultMap.put("result","success");
        System.out.println("我返回了");
        return resultMap;
    }
    
    
}
