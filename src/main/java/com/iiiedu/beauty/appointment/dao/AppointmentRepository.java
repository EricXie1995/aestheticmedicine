package com.iiiedu.beauty.appointment.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.iiiedu.beauty.model.Appointment;

public interface AppointmentRepository extends JpaRepository<Appointment, Integer>{
	
	@Query("select a from Appointment a where memberPkId = ?1")
	List<Appointment> appointmentUserList( Integer memberPkId);
}
