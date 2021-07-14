package com.iiiedu.beauty.appointment.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.iiiedu.beauty.model.Dist;

public interface AppointmentDistDao extends JpaRepository<Dist, Integer>{

	
	@Query("select d from Dist d where cityPkId = ?1")
	public List<Dist> getDist(Integer cityPkId);
}
