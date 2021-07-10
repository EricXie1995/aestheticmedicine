package com.iiiedu.beauty.Classification.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.iiiedu.beauty.Classification.dao.ClassificationDao;
import com.iiiedu.beauty.Classification.service.ClassificationService;
import com.iiiedu.beauty.model.Classification;

@Service
public class ClassificationServiceImpl implements ClassificationService {
	
	@Autowired
    private ClassificationDao classificationDao;

	@Override
	public Classification findById(int id) {
		// TODO Auto-generated method stub
		return classificationDao.getOne(id);
	}

	@Override
	public List<Classification> findAll(int type) {
		// TODO Auto-generated method stub
		return classificationDao.findByType(type);
	}

	@Override
	public Page<Classification> findAll(int type, Pageable pageable) {
		// TODO Auto-generated method stub
		return classificationDao.findByType(type, pageable);
	}

	@Override
	public List<Classification> findAllExample(Example<Classification> example) {
		// TODO Auto-generated method stub
		return classificationDao.findAll(example);
	}

	@Override
	public void update(Classification Classification) {
		// TODO Auto-generated method stub
		classificationDao.save(Classification);
		
	}

	@Override
	public int create(Classification Classification) {
		// TODO Auto-generated method stub
		Classification classification1 = classificationDao.save(Classification);
		return Classification.getId();
	}

	@Override
	public void delById(int id) {
		// TODO Auto-generated method stub
		classificationDao.deleteById(id);
		
	}

	@Override
	public List<Classification> findByParentId(int cid) {
		// TODO Auto-generated method stub
		return classificationDao.findByParentId(cid);
	}

}
