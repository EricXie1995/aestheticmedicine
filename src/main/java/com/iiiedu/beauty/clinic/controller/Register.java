package com.iiiedu.beauty.clinic.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.iiiedu.beauty.clinic.service.ClinicService;
import com.iiiedu.beauty.model.Clinic;


@Controller
@RequestMapping("/clinic")
public class Register {
	
	@Autowired
	private ClinicService clinicService;
	
//	@RequestMapping("/clinicRegister_test")
//	public String test(){
//		return "clinic/clinicRegister_test";
//	}
	
	@RequestMapping("/login_test")
	public String index(){
		return "clinic/login_test";
	}
	
	@RequestMapping("/clinicRegister_test")
	public String register() {
		return "clinic/clinicRegister_test";
	}
	
	@RequestMapping("doRegist")
	public String register(Clinic clinic) {
		clinicService.register(clinic);
		return "clinic/success_test";
	}
	
	@RequestMapping("doLogin")
	public String login(Clinic clinic) {
		clinic=clinicService.login(clinic.getClinicAccount(), clinic.getClinicPwd());
		if(clinic != null) {
			
			return "clinic/clinic_index";
		}
		return "clinic/fail_test";
		
	}
	
}
