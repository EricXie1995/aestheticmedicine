package com.iiiedu.beauty.forum.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.iiiedu.beauty.forum.dao.NotificationRepository;
import com.iiiedu.beauty.forum.service.NotificationService;
import com.iiiedu.beauty.model.Member;
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
	public Integer updateAllStatus(Integer memId) {
		return notificationRepository.updateAllStatus(memId);
	}
	
	@Override
	public Integer updateNotStatus(Integer notId) {
		return notificationRepository.updateNotStatus(notId);
	}

	@Override
	public Notification findOne(Integer notId) {
		return notificationRepository.findById(notId).get();
	}

	@Override
	public Integer grtUnreadcount(Integer memId) {
		return notificationRepository.grtUnreadcount(memId);
	}

	@Override
	public Notification save(Notification notification) {
		return notificationRepository.save(notification);
	}

	@Override
	public List<Notification> findAll() {
		return notificationRepository.findAll();
	}

	@Override
	public Integer deleteByNotificationPkId(Integer notId) {
		return notificationRepository.deleteByNotificationPkId(notId);
	}

	@Override
	public Integer deleteByMember(Member member) {
		return notificationRepository.deleteByMember(member);
	}
	
}
