package com.iiiedu.beauty.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Reply {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer ReplyPkId;
	private Integer parentid;
	private Integer type;
	private Integer commentor;
	private Integer like_count;
	private Long createtime;
	private Integer commentcount;
	private String content;
	@ManyToOne
	@JoinColumn(name = "questionPkId")
	private Question question;
	
	public Reply() {
	}
	public Integer getReplyPkId() {
		return ReplyPkId;
	}
	public void setReplyPkId(Integer replyPkId) {
		ReplyPkId = replyPkId;
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
	public Integer getCommentor() {
		return commentor;
	}
	public void setCommentor(Integer commentor) {
		this.commentor = commentor;
	}
	public Integer getLike_count() {
		return like_count;
	}
	public void setLike_count(Integer like_count) {
		this.like_count = like_count;
	}
	public Long getCreatetime() {
		return createtime;
	}
	public void setCreatetime(Long createtime) {
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
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Reply [ReplyPkId=");
		builder.append(ReplyPkId);
		builder.append(", parentid=");
		builder.append(parentid);
		builder.append(", type=");
		builder.append(type);
		builder.append(", commentor=");
		builder.append(commentor);
		builder.append(", like_count=");
		builder.append(like_count);
		builder.append(", createtime=");
		builder.append(createtime);
		builder.append(", commentcount=");
		builder.append(commentcount);
		builder.append(", content=");
		builder.append(content);
		builder.append(", question=");
		builder.append(question);
		builder.append("]");
		return builder.toString();
	}
	
}
