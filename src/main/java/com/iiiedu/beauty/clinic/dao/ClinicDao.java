package com.iiiedu.beauty.clinic.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.iiiedu.beauty.model.Clinic;

@Repository
public interface ClinicDao extends JpaRepository<Clinic, Integer> {
	@Query("SELECT u FROM Clinic u WHERE u.clinicAccount = ?1")
	public Clinic findByAccountAndPassword(String clinicAccount, String clinicPwd);
	
}
