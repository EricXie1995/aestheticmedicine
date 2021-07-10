package com.iiiedu.beauty.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

//論壇，回覆問題後的通知，構思中
@Entity
public class Notification {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer notificationPkId;
	
	@ManyToOne
	@JoinColumn(name = "replyPkId")
	private Reply reply; 
//	private int notifier;
	
	@ManyToOne
	@JoinColumn(name = "questionPkId")
	private Question question; 
	
//	private int receiver;
//	private int outerid;
//	private int type;
	private long createtime;
	private int status;
	
	@ManyToOne
	@JoinColumn(name = "memberPkId")
	private Member member;

	public Notification() {
		super();
	}

	public Integer getNotificationPkId() {
		return notificationPkId;
	}

	public void setNotificationPkId(Integer notificationPkId) {
		this.notificationPkId = notificationPkId;
	}

	public Reply getReply() {
		return reply;
	}

	public void setReply(Reply reply) {
		this.reply = reply;
	}

	public Question getQuestion() {
		return question;
	}

	public void setQuestion(Question question) {
		this.question = question;
	}

	public long getCreatetime() {
		return createtime;
	}

	public void setCreatetime(long createtime) {
		this.createtime = createtime;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}
	
	
	
	
}
