package com.iiiedu.beauty.Classification.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.iiiedu.beauty.model.Classification;

public interface ClassificationDao extends JpaRepository<Classification, Integer> {
	
	List<Classification> findByType(int type);
	
	Page<Classification> findByType(int type, Pageable pageable);
	
	List<Classification> findByParentId(int cid);

}
