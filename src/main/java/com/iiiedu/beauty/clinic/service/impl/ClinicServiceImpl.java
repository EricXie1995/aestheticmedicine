package com.iiiedu.beauty.clinic.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iiiedu.beauty.clinic.dao.ClinicDao;
import com.iiiedu.beauty.clinic.service.ClinicService;
import com.iiiedu.beauty.model.Clinic;

@Service
@Transactional
public class ClinicServiceImpl implements ClinicService{

	@Autowired
	private ClinicDao clinicDao;
	
	public Clinic findByAccountAndPassword(String clinicAccount, String clinicPwd) {
		return clinicDao.findByAccountAndPassword(clinicAccount, clinicPwd);
	}

	//註冊
	public void register(Clinic clinic) {
		clinicDao.save(clinic);
		
	}

	//登入
	public Clinic login(String clinicAccount, String clinicPwd) {
		Clinic clinic=clinicDao.findByAccountAndPassword(clinicAccount, clinicPwd);
		if(clinic != null && clinic.getClinicPwd().equals(clinicPwd)) {
			return clinic;
		}
		return null;
	}

}