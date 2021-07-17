package com.iiiedu.beauty.appointment.service;

import java.util.List;

import com.iiiedu.beauty.model.Dist;


public interface AppointmentDistService {

	public List<Dist> getDist(Integer cityPkId);
	
	public List<Dist> findAll();
}
