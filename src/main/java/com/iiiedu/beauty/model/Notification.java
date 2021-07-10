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
import javax.persistence.Transient;

//論壇，回覆問題或回覆留言後的通知，構思中
@Entity
public class Notification {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer notificationPkId;
	
	@ManyToOne
	@JoinColumn(name = "replyPkId")
	private Reply reply; //哪一個回覆送來通知，有兩種，回覆問題跟回覆通知，要從Reply的parentid去判斷
//	private int notifier;
	
	@ManyToOne
	@JoinColumn(name = "questionPkId")
	private Question question; //不管消息來自回覆文章還是回覆留言，都要知道是來自哪個文章，但要知道是回覆文章還是回覆留言從Reply去判斷
	
//	private int receiver;
//	private int outerid;
//	private int type;
	@Temporal(TemporalType.TIMESTAMP)
    private Date createtime; //通知時間
	private Integer status; //0未讀,1已讀
	
	@ManyToOne
	@JoinColumn(name = "memberPkId")
	private Member member; //接收通知的人
	
//	@Transient
	//找到當初自己對某問題的回覆內容，抓這個只是為了能在個人消息頁面顯示出來某某對你在某文章下的"哪一個留言"進行回覆)
	private String selfReplyContent; 

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

	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date date) {
		this.createtime = date;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public String getSelfReplyContent() {
		return selfReplyContent;
	}

	public void setSelfReplyContent(String selfReplyContent) {
		this.selfReplyContent = selfReplyContent;
	}
	
	
	
	
}
