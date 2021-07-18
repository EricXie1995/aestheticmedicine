package com.iiiedu.beauty.forum.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

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
	
	Integer findQueCountByMonth(Integer month);
	
	List<Question> findAllByOrderByCreatetimeDesc();
	
	List<Question> findAllLikeSearch(String likeString);
	
	List<Question> findAllByDate(String date1, String date2);
	
	List<Question> findByType(Integer typId);
	
	List<Question> findByLikeAndDateAndType(String likeString, String date1, String date2, Integer typId);
	
	List<Question> findByDateAndType(String date1, String date2, Integer typId);
	
	List<Question> findAllLikeSearch2(String likeString, Integer queId);
	
	Integer updateCutView(Integer queId);
	
	Integer updateStatus1(Integer queId);
	
	Integer updateStatus0(Integer queId);
}
