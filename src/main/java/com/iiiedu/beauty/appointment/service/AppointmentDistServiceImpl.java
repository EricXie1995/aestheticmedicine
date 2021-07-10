package com.iiiedu.beauty.appointment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iiiedu.beauty.appointment.dao.AppointmentDistDao;
import com.iiiedu.beauty.model.Dist;


@Service
public class AppointmentDistServiceImpl implements AppointmentDistService{

//	@Autowired
//	Appointment appointment;
//	
	@Autowired
	AppointmentDistDao appointmentDistDao;
	
	@Override
	public List<Dist> findAll() {
		return appointmentDistDao.findAll();
	}


}
