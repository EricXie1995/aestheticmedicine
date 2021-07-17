package com.iiiedu.beauty.forum.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iiiedu.beauty.forum.dao.TypeRepository;
import com.iiiedu.beauty.forum.service.TypeService;
import com.iiiedu.beauty.model.Question;
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

	@Override
	public Type save(Type type) {
		return typeRepository.save(type);
	}

	@Override
	public Integer deleteByTypePkId(Integer typId) {
		return typeRepository.deleteByTypePkId(typId);
	}

	@Override
	public List<Type> findTypeLikeSearch(String likeString) {
		return typeRepository.findTypeLikeSearch(likeString);
	}

}
