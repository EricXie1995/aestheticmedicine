package com.iiiedu.beauty.forum.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.iiiedu.beauty.model.Question;

public interface QuestionRepository extends JpaRepository<Question, Integer> {


	@Query(value = "select * from question where memberPkId = ?1", nativeQuery = true)
	Page<Question> findByQuery(Integer memId,Pageable pageable);
	
	//瀏覽數
	@Modifying
	@Query(value = "update question set view_count = isnull(view_count, 0)+1 where questionpkid = ?1", nativeQuery = true)
	Integer updateView(Integer queId);
	
	//回覆數
	@Modifying
	@Query(value = "update question set comment_count = isnull(comment_count, 0)+1 where questionpkid = ?1", nativeQuery = true)
	Integer updatecomment(Integer parId);


}
