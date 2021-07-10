package com.iiiedu.beauty.forum.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iiiedu.beauty.forum.dao.TypeRepository;
import com.iiiedu.beauty.forum.service.TypeService;
import com.iiiedu.beauty.model.Type;

@Service
@Transactional
public class TypeServiceImpl implements TypeService{

	@Autowired
	private TypeRepository typeRepository;
	
	@Override
	public List<Type> findAll() {
		return typeRepository.findAll();
	}

	@Override
	public Type findOne(Integer typId) {
		return typeRepository.findById(typId).get();
	}

}
