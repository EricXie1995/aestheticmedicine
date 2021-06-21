package com.iiiedu.beauty.forum.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.iiiedu.beauty.model.Question;

public interface QuestionRepository extends JpaRepository<Question, Integer> {

//	@Query("select q from Question q where q.memberPkId = ?1")
//    List<Question> findByQuery(Integer memPkId,Pageable pageable);
	
//	Page<Question> findByMemberPkId(Integer memId,Pageable pageable);
	
//	Question findByMemberPkId(Integer id);
	@Query(value = "select * from question where memberPkId = ?1", nativeQuery = true)
	Page<Question> findByQuery(Integer memId,Pageable pageable);
	
	@Modifying
	@Query(value = "update question set view_count = isnull(view_count, 0)+1 where questionpkid = ?1", nativeQuery = true)
	Integer updateView(Integer queId);
	
//	@Query(select q.* FROM question q JOIN member m ON q.memberPkId = m.memberPkId WHERE q.id = ?1 AND m.id = ?1)
//	Page<Question> findByQuery(Integer memPkId,Pageable pageable);

//	@Query("select q from Question q where q.questionPkId = ?1")
//	Question findByQuery(Integer memPkId);

}
