package com.iiiedu.beauty.forum.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.iiiedu.beauty.model.Member;
import com.iiiedu.beauty.model.Notification;

public interface NotificationRepository extends JpaRepository<Notification, Integer> {
	// 取得某個登錄者的所有通知
	@Query(value = "select * from notification where memberPkId = ?1", nativeQuery = true)
	Page<Notification> findByQuery(Integer memId, Pageable pageable);

	// 將某個通知設為已讀
	@Modifying
	@Query(value = "update notification set status = 1 where notificationPkId = ?1", nativeQuery = true)
	Integer updateStatus(Integer notId);

	// 將目前登錄使用者全部通知設為已讀
	@Modifying
	@Query(value = "update notification set status = 1 where memberPkId = ?1", nativeQuery = true)
	Integer updateAllStatus(Integer memId);

	// 將目前登錄使用者某個通知設為已讀
	@Modifying
	@Query(value = "update notification set status = 1 where notificationPkId = ?1", nativeQuery = true)
	Integer updateNotStatus(Integer notId);

	// 計算未讀數量
	@Query(value = "select count(*) from notification where memberPkId = ?1 and status=0", nativeQuery = true)
	Integer grtUnreadcount(Integer memId);
	
	// 透過notificationPkId刪除
	Integer deleteByNotificationPkId(Integer notId);
	
	// 透過memberPkId刪除
	Integer deleteByMember(Member member);

}
