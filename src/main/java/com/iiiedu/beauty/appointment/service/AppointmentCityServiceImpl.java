package com.iiiedu.beauty.appointment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iiiedu.beauty.appointment.dao.AppointmentCityDao;
import com.iiiedu.beauty.model.Appointment;
import com.iiiedu.beauty.model.City;
import com.iiiedu.beauty.model.Dist;


@Service
public class AppointmentCityServiceImpl implements AppointmentCityService {

//	@Autowired
//	Appointment appointment;
	
	@Autowired
	AppointmentCityDao appointmentCityDao;
	

	@Override
	public List<City> findAll() {
		return appointmentCityDao.findAll();
	}
	
}
