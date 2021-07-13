package com.iiiedu.beauty.forum.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.iiiedu.beauty.model.Question;

public interface QuestionService {
	public List<Question> findAll();

	public Page<Question> findAllByPage(Pageable pageable);

//	public List<Question> findAllByPages(Pageable pageable);

	public Question findOne(Integer id);

	public Page<Question> findByMemIdToQues(Integer memPkId, Pageable pageable);

	public Page<Question> findByType(Integer typId, Pageable pageable);

	public Question save(Question question);

	public Integer increaseview(Integer queId);

	public Integer increasecomment(Integer parId);

	Integer updateFavCount(Integer favCount, Integer queId);

	Integer deleteByQuestionPkId(Integer queId);
	
	Integer findQueCountBYTypId(Integer typId);

}
