package com.iiiedu.beauty.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Comments {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer commentPkId;
	@ManyToOne
	@JoinColumn(name = "appointmentPkId")
	private Appointment appointment;
	private Integer rate;
	private String commentContext;
	
	public Comments() {
	}

	public Integer getCommentPkId() {
		return commentPkId;
	}

	public void setCommentPkId(Integer commentPkId) {
		this.commentPkId = commentPkId;
	}

	public Appointment getAppointment() {
		return appointment;
	}

	public void setAppointment(Appointment appointment) {
		this.appointment = appointment;
	}

	public Integer getRate() {
		return rate;
	}

	public void setRate(Integer rate) {
		this.rate = rate;
	}

	public String getCommentContext() {
		return commentContext;
	}

	public void setCommentContext(String commentContext) {
		this.commentContext = commentContext;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Comments [commentPkId=");
		builder.append(commentPkId);
		builder.append(", appointment=");
		builder.append(appointment);
		builder.append(", rate=");
		builder.append(rate);
		builder.append(", commentContext=");
		builder.append(commentContext);
		builder.append("]");
		return builder.toString();
	}
	
	
}
