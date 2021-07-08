package com.iiiedu.beauty.appointment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iiiedu.beauty.appointment.dao.AppointmentItemsDao;
import com.iiiedu.beauty.model.Appointment;
import com.iiiedu.beauty.model.Items;

@Service
public class AppointmentItemsServiceImpl implements AppointmentItemsService {

//	@Autowired
//	Appointment appointment;
	
	@Autowired
	AppointmentItemsDao appointmentItemsDao;
	
	@Override
	public List<Items> findAll() {
		return appointmentItemsDao.findAll();
	}
}
