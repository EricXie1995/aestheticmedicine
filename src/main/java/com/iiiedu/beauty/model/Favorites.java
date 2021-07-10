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

@Entity
public class Favorites {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer FavoritesPkId;
	
	@ManyToOne
	@JoinColumn(name = "memberPkId")
	private Member member;
	
	@ManyToOne
	@JoinColumn(name = "questionPkId")
	private Question question;
	
	@Temporal(TemporalType.TIMESTAMP)
    private Date createtime; //拿來儲存文章的創建時間，只是拿來給PersonalController排序用

	public Favorites() {
	}

	public Integer getFavoritesPkId() {
		return FavoritesPkId;
	}

	public void setFavoritesPkId(Integer favoritesPkId) {
		FavoritesPkId = favoritesPkId;
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

	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
	
	
}
