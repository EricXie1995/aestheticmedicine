package com.iiiedu.beauty.forum.service;

import java.util.List;

import com.iiiedu.beauty.model.Question;
import com.iiiedu.beauty.model.Type;

public interface TypeService {
	
	List<Type> findAll();
	
	Type findOne(Integer typId);
	
	Type save(Type type);
	
	Integer deleteByTypePkId(Integer typId);
	
	List<Type> findTypeLikeSearch(String likeString);
}
