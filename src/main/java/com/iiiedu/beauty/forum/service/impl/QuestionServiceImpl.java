package com.iiiedu.beauty.forum.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iiiedu.beauty.forum.dao.QuestionRepository;
import com.iiiedu.beauty.forum.service.QuestionService;
import com.iiiedu.beauty.model.Question;

@Service
@Transactional
public class QuestionServiceImpl implements QuestionService {
	
	@Autowired
	private QuestionRepository questionRepository;

	@Override
	public List<Question> findAll() {
		return questionRepository.findAll();
	}
	
	@Override
	public Page<Question> findAllByPage(Pageable pageable) {
		return questionRepository.findAll(pageable);
	}
	
	@Override
	public Question save(Question question) {
		return questionRepository.save(question);
	}





}
