package com.iiiedu.beauty.appointment.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.iiiedu.beauty.model.City;

public interface AppointmentDao extends JpaRepository<City, Integer>{
	
//	List<City> findAll();
} 
