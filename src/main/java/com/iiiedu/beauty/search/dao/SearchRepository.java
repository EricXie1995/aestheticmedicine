package com.iiiedu.beauty.search.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.iiiedu.beauty.model.Clinic;

public interface SearchRepository extends JpaRepository<Clinic, Integer>{
	
	@Query(value = "select * from clinic where clinicCity = ?1 and clinicDist like %?2%", nativeQuery = true)
	Page<Clinic> findByCliniccityAndClinicdist(String Cliniccity, String Clinicdist, Pageable pageable);

	@Query(value = "select * from clinic where clinicCity = ?1 and clinicDist like %?2% and clinicName like %?3%", nativeQuery = true)
	Page<Clinic> findByCityAndDistAndlikeString(String city, String dist, String likeString, Pageable pageable);
	
	@Query(value = "select * from clinic where clinicCity = ?1 and clinicDist like %?2% and clinicName like %?3% and clinicType like %?4%", nativeQuery = true)
	Page<Clinic> findByCityAndDistAndlikeString1(String city, String dist, String likeString, String type1, Pageable pageable);
	
	@Query(value = "select * from clinic where clinicCity = ?1 and clinicDist like %?2% and clinicName like %?3% and (clinicType like %?4% or clinicType like %?5%)", nativeQuery = true)
	Page<Clinic> findByCityAndDistAndlikeString2(String city, String dist, String likeString, String type1, String type2, Pageable pageable);
	
	@Query(value = "select * from clinic where clinicCity = ?1 and clinicDist like %?2% and clinicName like %?3% and (clinicType like %?4% or clinicType like %?5% or clinicType like %?6%)", nativeQuery = true)
	Page<Clinic> findByCityAndDistAndlikeString3(String city, String dist, String likeString, String type1, String type2, String type3, Pageable pageable);
}
