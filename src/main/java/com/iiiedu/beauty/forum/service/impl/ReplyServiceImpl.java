package com.iiiedu.beauty.forum.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iiiedu.beauty.forum.dao.ReplyRepository;
import com.iiiedu.beauty.forum.service.ReplyService;
import com.iiiedu.beauty.model.Reply;

@Service
@Transactional
public class ReplyServiceImpl implements ReplyService{
	
	@Autowired
	private ReplyRepository replyRepository;

	@Override
	public List<Reply> findByQueIdToReply(Integer queId) {
		return replyRepository.findByQuery(queId);
	}

	@Override
	public List<Reply> findByParentid(Integer parId) {
		return replyRepository.findByParentidOrderByCreatetimeDesc(parId);
	}
	
	@Override
	public List<Reply> findByParIdAndType(Integer parId, Integer type) {
		return replyRepository.findByParentidAndTypeOrderByCreatetimeDesc(parId, type);
	}

	@Override
	public Reply save(Reply reply) {
		return replyRepository.save(reply);
	}

	@Override
	public Integer increaserecomment(Integer parId) {
		return replyRepository.updaterecomment(parId);
	}

	@Override
	public Reply findOne(Integer rePkId) {
		return replyRepository.findById(rePkId).get(); 
	}

}
