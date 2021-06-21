package com.iiiedu.beauty.admin.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.iiiedu.beauty.admin.service.AdminUserService;
import com.iiiedu.beauty.model.AdminUser;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminUserService adminUserService;
	
//	導向首頁
	@RequestMapping("/index")
	public String toIndex() {
		return "admin/index";
	}
	
//	登入頁面
	@RequestMapping("/login")
	public String toLogin() {
		return "admin/login";
	}
	
//	登入請求
	@RequestMapping(method = RequestMethod.POST, value = "/login.do")
	public void login(String username, String password, HttpServletRequest request, HttpServletResponse response) throws IOException {
		AdminUser adminUser = adminUserService.checkLogin(request, username, password);
		response.sendRedirect("/beauty/admin/index");
	}
	
//	登出清求
	@RequestMapping("/logout.do")
	public void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.getSession().removeAttribute("login_user");
		response.sendRedirect("login");
	}
	
}
