package com.iiiedu.beauty.search.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iiiedu.beauty.model.Clinic;
import com.iiiedu.beauty.search.dao.SearchRepository;

@Transactional
@Service
public class SearchService {
	@Autowired
	private SearchRepository searchRepository;
	
	public Page<Clinic> findByCliniccityAndClinicdist(String clinicCity, String clinicDist, Pageable pageable){
		return searchRepository.findByCliniccityAndClinicdist(clinicCity, clinicDist, pageable);
	}
	
	public Page<Clinic> findALL(Pageable pageable){
		return searchRepository.findAll(pageable);
	}
	
	public Page<Clinic> findByCityAndDistAndlikeString(String city, String dist, String likeString, Pageable pageable){
		return searchRepository.findByCityAndDistAndlikeString(city, dist, likeString, pageable);
	}
	public Page<Clinic> findByCityAndDistAndlikeString1(String city, String dist, String likeString, String type1, Pageable pageable){
		return searchRepository.findByCityAndDistAndlikeString1(city, dist, likeString, type1, pageable);
	}
	
	public Page<Clinic> findByCityAndDistAndlikeString2(String city, String dist, String likeString, String type1, String type2, Pageable pageable){
		return searchRepository.findByCityAndDistAndlikeString2(city, dist, likeString, type1, type2, pageable);
	}

	public Page<Clinic> findByCityAndDistAndlikeString3(String city, String dist, String likeString, String type1, String type2, String type3, Pageable pageable){
		return searchRepository.findByCityAndDistAndlikeString3(city, dist, likeString, type1, type2, type3, pageable);
	}
}
