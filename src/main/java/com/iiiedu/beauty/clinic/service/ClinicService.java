package com.iiiedu.beauty.clinic.service;

import com.iiiedu.beauty.model.Clinic;

public interface ClinicService  {
	
	Clinic findByAccountAndPassword(String clinicAccount, String clinicPwd);

	//註冊
	void register(Clinic clinic);

	//登入
	Clinic login(String clinicAccount, String clinicPwd);
}
