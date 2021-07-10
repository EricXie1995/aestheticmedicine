package com.iiiedu.beauty.forum.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.iiiedu.beauty.model.Notification;

public interface NotificationService {

	Page<Notification> findByMemIdToNoti(Integer memPkId,Pageable pageable);
	
	Integer updateStatus(Integer notId);
	
	Notification findOne(Integer notId);
}
