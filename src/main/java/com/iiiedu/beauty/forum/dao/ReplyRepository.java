package com.iiiedu.beauty.forum.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.iiiedu.beauty.model.Reply;

public interface ReplyRepository extends JpaRepository<Reply, Integer> {

	@Query(value = "select * from reply where questionPkId = ?1", nativeQuery = true)
	List<Reply> findByQuery(Integer queId);

	List<Reply> findByParentidOrderByCreatetimeDesc(Integer parId); 

	List<Reply> findByParentidAndTypeOrderByCreatetimeDesc(Integer parId, Integer type);

	//回覆的回覆數
	@Modifying
	@Query(value = "update reply set commentcount = isnull(commentcount, 0)+1 where replyPkId = ?1", nativeQuery = true)
	Integer updaterecomment(Integer parId);

}
