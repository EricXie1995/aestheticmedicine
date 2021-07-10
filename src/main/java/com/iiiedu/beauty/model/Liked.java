package com.iiiedu.beauty.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Liked {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer likedPkId;
	
	private Integer likedStatus;
	
	@Temporal(TemporalType.TIMESTAMP)
    private Date createtime;
	
	@ManyToOne
	@JoinColumn(name = "memberPkId")
	private Member member;
	
	@ManyToOne
	@JoinColumn(name = "questionPkId")
	private Question question;
	
	@ManyToOne
	@JoinColumn(name = "replyPkId")
	private Reply reply;

	public Liked() {
	}

	public Integer getLikedPkId() {
		return likedPkId;
	}

	public void setLikedPkId(Integer likedPkId) {
		this.likedPkId = likedPkId;
	}

	public Integer getLikedStatus() {
		return likedStatus;
	}

	public void setLikedStatus(Integer likedStatus) {
		this.likedStatus = likedStatus;
	}

	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public Question getQuestion() {
		return question;
	}

	public void setQuestion(Question question) {
		this.question = question;
	}

	public Reply getReply() {
		return reply;
	}

	public void setReply(Reply reply) {
		this.reply = reply;
	}

	
}
