package com.iiiedu.beauty.forum.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.iiiedu.beauty.model.Question;

public interface QuestionService {
	public List<Question> findAll();
	
	public Page<Question> findAllByPage(Pageable pageable);
	
	public Question save(Question question);
	
	
}