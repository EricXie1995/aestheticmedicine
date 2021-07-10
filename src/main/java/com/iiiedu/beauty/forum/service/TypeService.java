package com.iiiedu.beauty.forum.service;

import java.util.List;

import com.iiiedu.beauty.model.Type;

public interface TypeService {
	
	public List<Type> findAll();
	
	Type findOne(Integer typId);
}
