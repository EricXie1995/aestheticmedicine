package com.iiiedu.beauty.forum.service.impl;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.iiiedu.beauty.forum.dao.NotificationRepository;
import com.iiiedu.beauty.forum.service.NotificationService;
import com.iiiedu.beauty.model.Notification;

@Service
@Transactional
public class NotificationServiceImpl implements NotificationService{
	
	@Autowired
	private NotificationRepository notificationRepository;
	
	//透過memberPkId找到通知，分頁列出
	@Override
	public Page<Notification> findByMemIdToNoti(Integer memPkId,Pageable pageable){
		return notificationRepository.findByQuery(memPkId, pageable);
		
	}

	@Override
	public Integer updateStatus(Integer notId) {
		return notificationRepository.updateStatus(notId);
	}

	@Override
	public Notification findOne(Integer notId) {
		return notificationRepository.findById(notId).get();
	}
	
	
}
