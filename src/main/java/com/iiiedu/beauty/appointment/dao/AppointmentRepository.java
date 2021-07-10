package com.iiiedu.beauty.appointment.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.iiiedu.beauty.model.Appointment;

public interface AppointmentRepository extends JpaRepository<Appointment, String>{
	
//	Appointment findOne(String appointmentPkId);
}
