package com.iiiedu.beauty.appointment.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.iiiedu.beauty.model.City;

public interface AppointmentCityDao extends JpaRepository<City, Integer>{
	
	
	
	List<City> findAll();
	
} 
