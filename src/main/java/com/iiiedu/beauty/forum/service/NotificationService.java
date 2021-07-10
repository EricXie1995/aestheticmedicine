package com.iiiedu.beauty.forum.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.iiiedu.beauty.model.Member;
import com.iiiedu.beauty.model.Notification;

public interface NotificationService {

	Page<Notification> findByMemIdToNoti(Integer memPkId,Pageable pageable);
	
	Integer updateStatus(Integer notId);
	
	Integer updateAllStatus(Integer memId);
	
	Integer updateNotStatus(Integer notId);
	
	Notification findOne(Integer notId);
	
	Integer grtUnreadcount(Integer memId);
	
	Notification save (Notification notification);
	
	List<Notification> findAll();
	
	Integer deleteByNotificationPkId(Integer notId);
	
	Integer deleteByMember(Member member);
	
}
