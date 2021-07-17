package com.iiiedu.beauty.appointment.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.iiiedu.beauty.model.TimeTable;

public interface AppointmentTimeTableDao extends JpaRepository<TimeTable, Integer>{
	
	@Query("select t from TimeTable t where weekdays = ?1")
	List<TimeTable> findAllByWeek(String weekdays);
}
