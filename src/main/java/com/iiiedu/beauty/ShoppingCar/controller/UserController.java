package com.iiiedu.beauty.ShoppingCar.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.iiiedu.beauty.ShoppingCar.service2.EvaluationService;
import com.iiiedu.beauty.ShoppingCar.service2.ShoppingCarService;
import com.iiiedu.beauty.ShoppingCar.service2.ShoppingRecordService;
import com.iiiedu.beauty.ShoppingCar.service2.UserDetailService;
import com.iiiedu.beauty.ShoppingCar.service2.UserService;
import com.iiiedu.beauty.model.Evaluation;
import com.iiiedu.beauty.model.ShoppingCar;
import com.iiiedu.beauty.model.ShoppingRecord;
import com.iiiedu.beauty.model.UserDetail;
import com.iiiedu.beauty.model.UserMain;

/**
 * Created by 14437 on 2017/3/1.
 */
@Controller
@RequestMapping("/shoppingMall")
public class UserController {

    @Resource
    UserService userService;

    @Resource
    UserDetailService userDetailService;
    
    @Resource
    EvaluationService evaluationService;
    
    @Resource
    ShoppingRecordService shoppingRecordService;
    
    @Resource
    ShoppingCarService shoppingCarService;

    @RequestMapping(value = "/register")
    public String register() {
        return "shoppingMall/register";
    }

    @RequestMapping(value = "/amend_info")
    public String amend_info() {
        return "shoppingMall/amend_info";
    }

    @RequestMapping(value = "/login")
    public String login() {
        return "shoppingMall/login";
    }

    @RequestMapping(value = "/main")
    public String main() {
        return "shoppingMall/main";
    }

    @RequestMapping(value = "/control")
    public String control() {
        return "shoppingMall/control";
    }

    @RequestMapping(value = "/doLogin", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> doLogin(String userNameOrEmail, String password, HttpSession httpSession) {
        System.out.println("???????????????????????????" + userNameOrEmail + " " + password);
        String result = "fail";
        UserMain user = userService.findByEmailOrName(userNameOrEmail);
        if (user == null)
            result = "unexist";
        else {
        	System.out.println(user.getId());
            UserDetail userDetail = userDetailService.getUserDetail(user.getId());
            if (userDetail.getPassword().equals(password)) {
                result = "success";
                httpSession.setAttribute("currentUser", user);
            } else
                result = "wrong";
        }
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("result", result);
        return resultMap;
    }

    @RequestMapping(value = "/doRegister", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> doRegister(String userName, String email, String nickName, String password, String phoneNumber, int sex, String birthday, String postNumber, String address) {

        String result = "fail";
        UserMain user = userService.findByEmailOrName(userName);
        if (user != null) {
            result = "nameExist";
        } else {
            user = userService.findByEmailOrName(email);
            if (user != null)
                result = "emailExist";
            else {
            	UserMain user1 = new UserMain();
                user1.setName(userName);
                System.out.println(userName);
                user1.setEmail(email);
                System.out.println(email);
                user1.setNickName(nickName);
                System.out.println(nickName);
                user1.setRole(0);
                userService.addUser(user1);
                user1 = userService.findByEmailOrName(userName);
                UserDetail userDetail = new UserDetail();
                UserMain userMain = userService.getUser(user1.getId());
                userDetail.setUserMain(userMain);
                userDetail.setAddress(address);
                userDetail.setBirthday(birthday);
                userDetail.setPassword(password);
                userDetail.setPhoneNumber(phoneNumber);
                userDetail.setSex(sex);
                userDetail.setPostNumber(postNumber);
                Date date = new Date();
                SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                userDetail.setRegisterTime(sf.format(date));
                userDetailService.addUserDetail(userDetail);
                result = "success";
            }
        }
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("result", result);
        return resultMap;
    }

    @RequestMapping(value = "/doUpdate", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> doUpdate(String userName, String email, String nickName, String password, String phoneNumber, int sex, String birthday, String postNumber, String address) {
        String result = "fail";
        UserMain user = userService.findByEmailOrName(userName);
        user.setEmail(email);
        user.setNickName(nickName);
        userService.updateUser(user);
        UserDetail userDetail = userDetailService.getUserDetail(user.getId());
        userDetail.setAddress(address);
        userDetail.setBirthday(birthday);
        userDetail.setPassword(password);
        userDetail.setPhoneNumber(phoneNumber);
        userDetail.setSex(sex);
        userDetail.setPostNumber(postNumber);
        userDetailService.updateUserDetail(userDetail);
        result = "success";
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("result", result);
        return resultMap;
    }

    @RequestMapping(value = "/getAllUser", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getAllUser() {
//        System.out.println("?????????????????????????????????");
        List<UserMain> userList = new ArrayList<>();
        userList = userService.getAllUser();
        String allUsers = JSONArray.toJSONString(userList);
//        System.out.println("?????????????????????"+allUsers);
        Map<String,Object> resultMap = new HashMap<String,Object>();
        resultMap.put("allUsers",allUsers);
        return resultMap;
    }

    //2018.04.08 ??????BUG ??????????????????????????????????????????
    @RequestMapping(value = "/deleteUser", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> deleteUser(int id) {
    	System.out.println("/deleteUser id = "+id);
//    	shoppingRecordService.deleteShoppingRecord(id);
//    	shoppingCarService.deleteShoppingCar(id);
//    	userDetailService.deleteUserDetail(id);
         userService.deleteUser(id);
         Map<String,Object> resultMap = new HashMap<String,Object>();
         resultMap.put("result","Success");
         return resultMap;
    }

    @RequestMapping(value = "/getUserAddressAndPhoneNumber", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getUserAddressAndPhoneNumber(int recordId) {
    	System.out.println(recordId+"--------------------");
    	ShoppingRecord shoppingRecord = shoppingRecordService.getShoppingRecordById(recordId);
        String address = userDetailService.getUserDetail(shoppingRecord.getUserMain().getId()).getAddress();
        String phoneNumber = userDetailService.getUserDetail(shoppingRecord.getUserMain().getId()).getPhoneNumber();
        Map<String,Object> resultMap = new HashMap<String,Object>();
        resultMap.put("address",address);
        resultMap.put("phoneNumber",phoneNumber);
        return resultMap;
    }

    @RequestMapping(value = "/getUserAddress", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getUserAddress(Integer id) {
    	System.out.println(id+"---------------7777777777777-----------------");
    	ShoppingCar shoppingCar = shoppingCarService.getShoppingCarById(id);
        String address = userDetailService.getUserDetail(shoppingCar.getUserMain().getId()).getAddress();
        Map<String,Object> resultMap = new HashMap<String,Object>();
        resultMap.put("address",address);
        return resultMap;
    }
    
    @RequestMapping(value = "/getUserPhoneNumber", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getUserPhoneNumber(Integer id) {
    	System.out.println(id+"---------------8888888888888-----------------");
    	ShoppingCar shoppingCar = shoppingCarService.getShoppingCarById(id);
        String phoneNumber = userDetailService.getUserDetail(shoppingCar.getUserMain().getId()).getPhoneNumber();
        Map<String,Object> resultMap = new HashMap<String,Object>();
        resultMap.put("phoneNumber",phoneNumber);
        return resultMap;
    }

    
    @RequestMapping(value = "/doLogout")
    public String doLogout(HttpSession httpSession){
        httpSession.setAttribute("currentUser","");
        return "redirect:login";
    }

    @RequestMapping(value = "/getUserById", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getUserById(int id) {
    	System.out.println(id+"getUserById");
    	UserMain user = userService.getUser(id);
    	System.out.println(user+"12312313");
        String result = JSON.toJSONString(user);
        Map<String,Object> resultMap = new HashMap<String,Object>();
        resultMap.put("result",result);
        return resultMap;
    }
    
    @RequestMapping(value = "/getUserByRecordId", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getUserByRecordId(int id) {
    	System.out.println(id+"getUserByRecordId");
    	ShoppingRecord shoppingRecord = shoppingRecordService.getShoppingRecordById(id);
    	UserMain user = shoppingRecord.getUserMain();
//    	System.out.println(user);
        String result = JSON.toJSONString(user);
        Map<String,Object> resultMap = new HashMap<String,Object>();
        resultMap.put("result",result);
        return resultMap;
    }
    

    @RequestMapping(value = "/getUserDetailById", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getUserDetailById(int id) {
        UserDetail userDetail = userDetailService.getUserDetail(id);
        String result = JSON.toJSONString(userDetail);
        Map<String,Object> resultMap = new HashMap<String,Object>();
        resultMap.put("result",result);
        return resultMap;
    }
    
    @RequestMapping(value = "/getUserByEvaId", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getUserByEvaId(int evaId) {
    	
    	Evaluation evaluation = evaluationService.findByEvaId(evaId);
    	
    	UserMain user = evaluation.getUserMain();
//    	System.out.println(user+"getUserByEvaId");
        String result = JSON.toJSONString(user);
        Map<String,Object> resultMap = new HashMap<String,Object>();
        resultMap.put("result",result);
        return resultMap;
    }

}
