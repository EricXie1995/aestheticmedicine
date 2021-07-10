package com.iiiedu.beauty.model;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
public class Member {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer memberPkId;

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "memberDetailsPkId",nullable = false)
	private MemberDetails memberDetails;

	@Column(nullable = false,unique = true,length = 45)
	private String memberAccount;

	@Column(length = 64)
	private String memberPwd;

	@Column(length = 10)
	private String memberIdNumber;

	private String memberName;

	private String memberAddress;

	private String memberPhone;

	private String memberStatus = "0";

	private String memberLineId;

	private String photos;

	@Column(length = 64)
	private String verificationCode;

	private boolean enabled;

	private String resetPasswordToken;

	@Enumerated(EnumType.STRING)
	private Provider provider = Provider.LOCAL;

	private Date passwordChangedTime = new Date();

	@OneToMany(mappedBy = "member", cascade = CascadeType.ALL)
	private List<Orders> orders = new ArrayList<>();
	@OneToMany(mappedBy = "member", cascade = CascadeType.ALL)
	private List<Appointment> appointment = new ArrayList<>();
	@OneToMany(mappedBy = "member", cascade = CascadeType.ALL)
	private List<Question> question = new ArrayList<>();
	@JsonManagedReference
	@OneToMany(mappedBy = "member", cascade = CascadeType.ALL)
	private List<Reply> reply = new ArrayList<>();
	@OneToMany(mappedBy = "member", cascade = CascadeType.ALL)
	private List<Notification> notification = new ArrayList<>();
	
	public Member() {
	}

	public Integer getMemberPkId() {
		return memberPkId;
	}

	public void setMemberPkId(Integer memberPkId) {
		this.memberPkId = memberPkId;
	}

	public MemberDetails getMemberDetails() {
		return memberDetails;
	}

	public void setMemberDetails(MemberDetails memberDetails) {
		this.memberDetails = memberDetails;
	}

	public String getMemberAccount() {
		return memberAccount;
	}

	public void setMemberAccount(String memberAccount) {
		this.memberAccount = memberAccount;
	}

	public String getMemberPwd() {
		return memberPwd;
	}

	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}

	public String getMemberIdNumber() {
		return memberIdNumber;
	}

	public void setMemberIdNumber(String memberIdNumber) {
		this.memberIdNumber = memberIdNumber;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberAddress() {
		return memberAddress;
	}

	public void setMemberAddress(String memberAddress) {
		this.memberAddress = memberAddress;
	}

	public String getMemberPhone() {
		return memberPhone;
	}

	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}

	public String getMemberStatus() {
		return memberStatus;
	}

	public void setMemberStatus(String memberStatus) {
		this.memberStatus = memberStatus;
	}

	public String getMemberLineId() {
		return memberLineId;
	}

	public void setMemberLineId(String memberLineId) {
		this.memberLineId = memberLineId;
	}

	public String getPhotos() {
		return photos;
	}

	public void setPhotos(String photos) {
		this.photos = photos;
	}

	public List<Orders> getOrders() {
		return orders;
	}

	public void setOrders(List<Orders> orders) {
		this.orders = orders;
	}

	public List<Appointment> getAppointment() {
		return appointment;
	}

	public void setAppointment(List<Appointment> appointment) {
		this.appointment = appointment;
	}

	public String getVerificationCode() {
		return verificationCode;
	}

	public void setVerificationCode(String verificationCode) {
		this.verificationCode = verificationCode;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}


	public String getResetPasswordToken() {
		return resetPasswordToken;
	}

	public void setResetPasswordToken(String resetPasswordToken) {
		this.resetPasswordToken = resetPasswordToken;
	}

	public Provider getProvider() {
		return provider;
	}

	public void setProvider(Provider provider) {
		this.provider = provider;
	}

	public Date getPasswordChangedTime() {
		return passwordChangedTime;
	}

	public void setPasswordChangedTime(Date passwordChangedTime) {
		this.passwordChangedTime = passwordChangedTime;
	}

	public enum Provider{
		LOCAL,GOOGLE
	}

	@Transient
	public String getPhotosImagePath(){
		if(photos == null || memberPkId == null) return null;
		return "/member_photos/" + memberPkId + "/" + photos;
	}

	private static final long PASSWORD_EXPIRATION_TIME
			= 30L * 24L * 60L * 60L * 1000L; //30day

	public boolean isPasswordExpired() {
		if (this.passwordChangedTime == null) return false;

		long currentTime = System.currentTimeMillis();
		long lastChangedTime = this.passwordChangedTime.getTime();

		return currentTime > lastChangedTime + PASSWORD_EXPIRATION_TIME;

	public List<Question> getQuestion() {
		return question;
	}

	public void setQuestion(List<Question> question) {
		this.question = question;
	}

	public List<Reply> getReply() {
		return reply;
	}

	public void setReply(List<Reply> reply) {
		this.reply = reply;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Member [memberPkId=");
		builder.append(memberPkId);
		builder.append(", memberDetails=");
		builder.append(memberDetails);
		builder.append(", memberAccount=");
		builder.append(memberAccount);
		builder.append(", memberPwd=");
		builder.append(memberPwd);
		builder.append(", memberIdNumber=");
		builder.append(memberIdNumber);
		builder.append(", memberName=");
		builder.append(memberName);
		builder.append(", memberAddress=");
		builder.append(memberAddress);
		builder.append(", memberPhone=");
		builder.append(memberPhone);
		builder.append(", memberStatus=");
		builder.append(memberStatus);
		builder.append(", memberLineId=");
		builder.append(memberLineId);
		builder.append(", verificationCode=");
		builder.append(verificationCode);
		builder.append(", headpic=");
		builder.append(", enabled=");
		builder.append(enabled);
		builder.append(", orders=");
		builder.append(orders);
		builder.append(", appointment=");
		builder.append(appointment);
		builder.append(", question=");
		builder.append(question);
		builder.append(", reply=");
		builder.append(reply);
		builder.append("]");
		return builder.toString();
	}

}
