package com.iiiedu.beauty.forum.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.iiiedu.beauty.model.Notification;
import com.iiiedu.beauty.model.Question;

public interface NotificationRepository extends JpaRepository<Notification, Integer> {
	
	@Query(value = "select * from notification where memberPkId = ?1", nativeQuery = true)
	Page<Notification> findByQuery(Integer memId,Pageable pageable);
	
	@Modifying
	@Query(value = "update notification set status = 1 where notId = ?1", nativeQuery = true)
	Integer updateStatus(Integer notId);
	
}
