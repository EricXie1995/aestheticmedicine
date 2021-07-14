package com.iiiedu.beauty.forum.service;

import java.util.List;

import com.iiiedu.beauty.model.Reply;

public interface ReplyService {

	public List<Reply> findByQueIdToReply(Integer queId);
	
	public List<Reply> findByParentid(Integer parId);
	
	public List<Reply> findByParIdAndType(Integer parId, Integer type);
	
	public  Reply save(Reply reply);
	
	public Integer increaserecomment(Integer parId);
	
	public Reply findOne(Integer rePkId);
	
}
