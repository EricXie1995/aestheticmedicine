package com.iiiedu.beauty.forum.dto;

import java.util.Date;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.iiiedu.beauty.model.Member;
import com.iiiedu.beauty.model.Question;

public class ReplyDto {

	private Integer replyPkId;
	private Integer parentid;
	private Integer type;
//	private Integer commentor;
	private Integer like_count;
    private Date createtime;
	private Integer commentcount;
	private String content;
	private Question question;
	private String memberName;
	public Integer getReplyPkId() {
		return replyPkId;
	}
	public void setReplyPkId(Integer replyPkId) {
		this.replyPkId = replyPkId;
	}
	public Integer getParentid() {
		return parentid;
	}
	public void setParentid(Integer parentid) {
		this.parentid = parentid;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public Integer getLike_count() {
		return like_count;
	}
	public void setLike_count(Integer like_count) {
		this.like_count = like_count;
	}
	public Date getCreatetime() {
		return createtime;
	}
	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
	public Integer getCommentcount() {
		return commentcount;
	}
	public void setCommentcount(Integer commentcount) {
		this.commentcount = commentcount;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Question getQuestion() {
		return question;
	}
	public void setQuestion(Question question) {
		this.question = question;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	
}
