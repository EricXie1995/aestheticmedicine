package com.iiiedu.beauty.ShoppingCar.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.iiiedu.beauty.ShoppingCar.service2.EvaluationService;
import com.iiiedu.beauty.ShoppingCar.service2.ProductService;
import com.iiiedu.beauty.ShoppingCar.service2.ShoppingRecordService;
import com.iiiedu.beauty.ShoppingCar.service2.UserService;
import com.iiiedu.beauty.model.Evaluation;
import com.iiiedu.beauty.model.Product;
import com.iiiedu.beauty.model.UserMain;

/**
 * Created by 14437 on 2017/3/7.
 */
@Controller
@RequestMapping("/shoppingMall")
public class EvaluationController {
    @Resource
    private EvaluationService evaluationService;

    @Resource
    private ShoppingRecordService shoppingRecordService;
    
    @Resource
    private UserService userService;
    @Resource
    private ProductService productService;

    @RequestMapping(value = "/addShoppingEvaluation",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> addShoppingEvaluation(int userPkId, int productPkId, String content){
        UserMain userMain = userService.getUser(userPkId);
        Product product = productService.getProduct(productPkId);
        System.out.println("我添加了"+userPkId+" "+productPkId);
        String result = null;
        if(shoppingRecordService.getUserProductRecord(userPkId,productPkId)){
            Evaluation evaluation = new Evaluation();
            evaluation.setUserMain(userMain);
            evaluation.setProduct(product);
            Date date = new Date();
            SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
            evaluation.setTime(sf.format(date));
            evaluation.setContent(content);
            evaluationService.addEvaluation(evaluation);
            result = "success";
        }
        else{
            result="noneRecord";
        }

        Map<String,Object> resultMap = new HashMap<String,Object>();
        resultMap.put("result",result);
        return resultMap;
    }

    @RequestMapping(value = "/getShoppingEvaluations",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> getShoppingEvaluations(int productId){
    	List<Evaluation> evaluationList = evaluationService.getProductEvaluations(productId);
        String evaluations = JSONArray.toJSONString(evaluationList);
        System.out.println(evaluations+"--------------------321321321--------------------------");
        Map<String,Object> resultMap = new HashMap<String,Object>();
        resultMap.put("result",evaluations);
        return resultMap;
    }
}
