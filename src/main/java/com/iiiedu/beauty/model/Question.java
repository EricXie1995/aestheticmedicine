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
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

@Entity
public class Question {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer questionPkId;
    private String title;
    @Lob
    private String description;
    private Integer qcommentcount;
    private Integer viewcount;
    private Integer like_count;
    private String tag;
    @Temporal(TemporalType.TIMESTAMP)
    private Date createtime;
    private Integer favoritecount;
    
    @ManyToOne
	@JoinColumn(name = "memberPkId")
	private Member member;
    
    @ManyToOne
    @JoinColumn(name = "typePkId")
    private Type type;
    
    @OneToMany(mappedBy = "question", cascade = CascadeType.ALL)
	private List<Reply> reply = new ArrayList<>();
    
    @OneToMany(mappedBy = "question", cascade = CascadeType.ALL)
	private List<Notification> notification = new ArrayList<>();
    
    @OneToMany(mappedBy = "question", cascade = CascadeType.ALL)
	private List<Liked> liked = new ArrayList<>();
    
    @OneToMany(mappedBy = "question", cascade = CascadeType.ALL)
	private List<Favorites> favorites = new ArrayList<>();
    
	public Question() {
		super();
	}
	public Integer getQuestionPkId() {
		return questionPkId;
	}
	public void setQuestionPkId(Integer questionPkId) {
		this.questionPkId = questionPkId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Integer getQcommentcount() {
		return qcommentcount;
	}
	public void setQcommentcount(Integer qcommentcount) {
		this.qcommentcount = qcommentcount;
	}
	public Integer getviewcount() {
		return viewcount;
	}
	public void setviewcount(Integer viewcount) {
		this.viewcount = viewcount;
	}
	public Integer getLike_count() {
		return like_count;
	}
	public void setLike_count(Integer like_count) {
		this.like_count = like_count;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
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
	
	public List<Reply> getReply() {
		return reply;
	}
	public void setReply(List<Reply> reply) {
		this.reply = reply;
	}
	
	public Type getType() {
		return type;
	}	
	public void setType(Type type) {
		this.type = type;
	}
	public List<Liked> getLiked() {
		return liked;
	}
	public void setLiked(List<Liked> liked) {
		this.liked = liked;
	}
	
	public Integer getFavoritecount() {
		return favoritecount;
	}
	public void setFavoritecount(Integer favoritecount) {
		this.favoritecount = favoritecount;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Question [questionPkId=");
		builder.append(questionPkId);
		builder.append(", title=");
		builder.append(title);
		builder.append(", description=");
		builder.append(description);
		builder.append(", qcommentcount=");
		builder.append(qcommentcount);
		builder.append(", viewcount=");
		builder.append(viewcount);
		builder.append(", like_count=");
		builder.append(like_count);
		builder.append(", tag=");
		builder.append(tag);
		builder.append(", createtime=");
		builder.append(createtime);
		builder.append(", member=");
		builder.append(member);
		builder.append(", reply=");
		builder.append(reply);
		builder.append("]");
		return builder.toString();
	}
	
}
