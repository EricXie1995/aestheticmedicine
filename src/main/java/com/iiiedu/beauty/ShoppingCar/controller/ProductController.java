package com.iiiedu.beauty.ShoppingCar.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.iiiedu.beauty.ShoppingCar.service2.ProductService;
import com.iiiedu.beauty.ShoppingCar.service2.ShoppingCarService;
import com.iiiedu.beauty.ShoppingCar.service2.ShoppingRecordService;
import com.iiiedu.beauty.model.Product;
import com.iiiedu.beauty.model.ShoppingCar;
import com.iiiedu.beauty.model.ShoppingRecord;

/**
 * Created by 14437 on 2017/3/1.
 */
@Controller
@RequestMapping("/shoppingMall")
public class ProductController {
    @Resource
    private ProductService productService;
    
    @Resource
    private ShoppingCarService shoppingCarService;
    
    @Resource
    private ShoppingRecordService shoppingRecordService;

    @RequestMapping(value = "/getAllProducts" ,method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> getAllProducts(){
        List<Product> productList = new ArrayList<>();
        productList = productService.getAllProduct();
        String allProducts = JSONArray.toJSONString(productList);
//        System.out.println(allProducts);
        Map<String,Object> resultMap = new HashMap<String,Object>();
        resultMap.put("allProducts",allProducts);
        return resultMap;
    }

    //推荐写法
    @RequestMapping(value = "/deleteProduct", method = RequestMethod.POST)
    @ResponseBody
    public void deleteProduct(int id) {
        productService.deleteProduct(id);
    }

    @RequestMapping(value = "/addProduct", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addProduct(String name,String description,String keyWord,int price,int counts,int type) {
        System.out.println("添加了商品："+name);
        String result ="fail";
        Product product = new Product();
        product.setName(name);
        product.setDescription(description);
        product.setKeyWord(keyWord);
        product.setPrice(price);
        product.setCounts(counts);
        product.setType(type);
        productService.addProduct(product);
        result = "success";
        Map<String,Object> resultMap = new HashMap<String,Object>();
        resultMap.put("result",result);
        return resultMap;
    }

    @RequestMapping(value = "/productDetail", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> productDetail(int id, HttpSession httpSession) {
        System.out.println("I am here!"+id);
        Product product = productService.getProduct(id);
        httpSession.setAttribute("productDetail",product);
        System.out.print("I am here"+product.getName());
        Map<String,Object> resultMap = new HashMap<String,Object>();
        resultMap.put("result","success");
        return resultMap;
    }

    @RequestMapping(value = "/product_detail")
    public String product_detail() {
        return "shoppingMall/product_detail";
    }

    @RequestMapping(value = "/searchPre", method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> searchPre(String searchKeyWord,HttpSession httpSession) {
        httpSession.setAttribute("searchKeyWord",searchKeyWord);
        Map<String,Object> resultMap = new HashMap<String,Object>();
        resultMap.put("result","success");
        return resultMap;
    }

    @RequestMapping(value = "/search")
    public String search() {
        return "shoppingMall/search";
    }

    @RequestMapping(value = "/searchProduct", method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> searchProduct(String searchKeyWord){
        System.out.println("我到了SearchProduct"+searchKeyWord);
        List<Product> productList = new ArrayList<Product>();
        productList = productService.getProductsByKeyWord(searchKeyWord);
        String searchResult = JSONArray.toJSONString(productList);
        Map<String,Object> resultMap = new HashMap<String,Object>();
        resultMap.put("result",searchResult);
        System.out.println("我返回了"+searchResult);
        return resultMap;
    }

    @RequestMapping(value = "/getProductById", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getProductById(int id) {
//    	System.out.println("123123132123-------------------------------"+id);
        Product product = productService.getProduct(id);
//        System.out.println("----------------------------------------------------------"+product);
        String result = JSON.toJSONString(product);
        Map<String,Object> resultMap = new HashMap<String,Object>();
        resultMap.put("result",result);
        return resultMap;
    }

    @RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> uploadFile(@RequestParam MultipartFile productImgUpload,String name, HttpServletRequest request) {
        String result = "fail";
        try{
            if(productImgUpload != null && !productImgUpload.isEmpty()) {
                String fileRealPath = request.getSession().getServletContext().getRealPath("/static/img");
                System.out.println(fileRealPath);
                int id = productService.getProduct(name).getId();
                String fileName = String.valueOf(id)+".jpg";
                File fileFolder = new File(fileRealPath);
                System.out.println("fileRealPath=" + fileRealPath+"/"+fileName);
                if(!fileFolder.exists()){
                    fileFolder.mkdirs();
                }
                File file = new File(fileFolder,fileName);
                productImgUpload.transferTo(file);
                result = "success";
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        Map<String,Object> resultMap = new HashMap<String,Object>();
        resultMap.put("result",result);
        return resultMap;
    }
    
    @RequestMapping(value = "/getProductByCarId", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getProductByCarId(int carId) {
    	System.out.println("77777777777777777777-------------------------------"+carId);
    	ShoppingCar shoppingCar = shoppingCarService.getShoppingCarById(carId);
        Product product = shoppingCar.getProduct();
//        System.out.println("----------------------------------------------------------"+product);
        String result = JSON.toJSONString(product);
        Map<String,Object> resultMap = new HashMap<String,Object>();
        resultMap.put("result",result);
        return resultMap;
    }
    
    @RequestMapping(value = "/getProductByRecordId", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getProductByRecordId(int recordId) {
    	System.out.println("-++++++++-+-+++-+-+---------------------------------"+recordId);
    	ShoppingRecord shoppingRecord = shoppingRecordService.getShoppingRecordById(recordId);
        Product product = shoppingRecord.getProduct();
//        System.out.println("----------------------------------------------------------"+product);
        String result = JSON.toJSONString(product);
        Map<String,Object> resultMap = new HashMap<String,Object>();
        resultMap.put("result",result);
        return resultMap;
    }
}
