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

	//搜尋全部問題
	@Override
	public List<Question> findAll() {
		return questionRepository.findAll();
	}
	
	//搜尋全部問題，分頁列出
	@Override
	public Page<Question> findAllByPage(Pageable pageable) {
		return questionRepository.findAll(pageable);
	}
	
//	@Override
//	public List<Question> findAllByPages(Pageable pageables) {
//		// TODO Auto-generated method stub
//		return (List<Question>) questionRepository.findAll(pageables);
//	}
	
	//透過questionPkId找到問題
	@Override
	public Question findOne(Integer id) {
		return questionRepository.findById(id).get();
	}
	
	//透過memberPkId找到問題，分頁列出
	@Override
	public Page<Question> findByMemIdToQues(Integer memPkId, Pageable pageable) {
		return questionRepository.findByQuery(memPkId, pageable);
	}
	
	//透過分類找到問題，分頁列出
	@Override
	public Page<Question> findByType(Integer typId, Pageable pageable) {
		return questionRepository.findByType(typId, pageable);
	}
	
	//新增問題或修改問題
	@Override
	public Question save(Question question) {
		return questionRepository.save(question);
	}
	
	//增加瀏覽數
	@Override
	public Integer increaseview(Integer queId) {
		return questionRepository.updateView(queId);
	}

	//增加問題的評論數
	@Override
	public Integer increasecomment(Integer parId) {
		return questionRepository.updatecomment(parId);
	}

	@Override
	public Integer updateFavCount(Integer favCount, Integer queId) {
		return questionRepository.updateFavCount(favCount, queId);
	}

	@Override
	public Integer deleteByQuestionPkId(Integer queId) {
		return questionRepository.deleteByQuestionPkId(queId);
	}

	@Override
	public Integer findQueCountBYTypId(Integer typId) {
		return questionRepository.findQueCountBYTypId(typId);
	}



}
