package com.iiiedu.beauty.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
public class Reply {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer replyPkId;
	//type=1 parentid就是questionPkId(回覆問題)、type=2 parentid就是replyPkId(回覆留言)
	private Integer parentid;
	//type=1是回覆問題、type=2是回覆留言
	private Integer type;
//	private Integer commentor;
	private Integer like_count;
	@Temporal(TemporalType.TIMESTAMP)
    private Date createtime;
	private Integer commentcount;
	private String content;
	@ManyToOne
	@JoinColumn(name = "questionPkId")
	private Question question;
	//多方加了@JsonBackReference才不會導致在使用@ResponseBody傳json格式資料的時後報錯誤訊息StackOverflowError(有外鍵的關係)，
	//一方要加@JsonManagedReference，但就會變成沒辦法透過外鍵獲取東西
	//參考網站 https://stackoverflow.com/questions/47693110/could-not-write-json-infinite-recursion-stackoverflowerror-nested-exception
	@JsonBackReference
	@ManyToOne
	@JoinColumn(name = "memberPkId")
	private Member member;
	@Transient
	private String memberName;
	
	@OneToMany(mappedBy = "reply", cascade = CascadeType.ALL)
	private List<Notification> notification = new ArrayList<>();
	
	@OneToMany(mappedBy = "reply", cascade = CascadeType.ALL)
	private List<Liked> liked = new ArrayList<>();
	
	private String headpic;
	
	public Reply() {
	}
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
//	public Integer getCommentor() {
//		return commentor;
//	}
//	public void setCommentor(Integer commentor) {
//		this.commentor = commentor;
//	}
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
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}
	
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public List<Liked> getLiked() {
		return liked;
	}
	public void setLiked(List<Liked> liked) {
		this.liked = liked;
	}
	
	public String getHeadpic() {
		return headpic;
	}
	public void setHeadpic(String headpic) {
		this.headpic = headpic;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Reply [replyPkId=");
		builder.append(replyPkId);
		builder.append(", parentid=");
		builder.append(parentid);
		builder.append(", type=");
		builder.append(type);
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
		builder.append(", member=");
		builder.append(member);
		builder.append("]");
		return builder.toString();
	}

	
	
}
