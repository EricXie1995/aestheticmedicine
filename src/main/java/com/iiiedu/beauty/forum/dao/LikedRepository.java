package com.iiiedu.beauty.forum.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.iiiedu.beauty.model.Liked;
import com.iiiedu.beauty.model.Notification;

public interface LikedRepository extends JpaRepository<Liked, Integer>{

	@Modifying
	@Query(value = "update liked set likedStatus = 0 where memberPkId = ?1 and questionPkId = ?2", nativeQuery = true)
	Integer updateQLikedStatus0(Integer menId, Integer quePkId);
	
	@Modifying
	@Query(value = "update liked set likedStatus = 1 where memberPkId = ?1 and questionPkId = ?2", nativeQuery = true)
	Integer updateQLikedStatus1(Integer menId, Integer quePkId);
	
	@Modifying
	@Query(value = "update liked set likedStatus = 0 where memberPkId = ?1 and replyPkId = ?2", nativeQuery = true)
	Integer updateRLikedStatus0(Integer menId, Integer quePkId);
	
	@Modifying
	@Query(value = "update liked set likedStatus = 1 where memberPkId = ?1 and replyPkId = ?2", nativeQuery = true)
	Integer updateRLikedStatus1(Integer menId, Integer quePkId);
	
	
	
}
