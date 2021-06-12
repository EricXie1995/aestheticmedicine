package com.iiiedu.beauty.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Member {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer memberPkId;
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "memberDetailsPkId")
	private MemberDetails memberDetails;
	private String memberAccount;
	private String memberPwd;
	private String memberIdNumber;
	private String memberName;
	private String memberAddress;
	private String memberPhone;
	private String memberStatus;
	private String memberLineId;
	@OneToMany(mappedBy = "member", cascade = CascadeType.ALL)
	private List<Orders> orders = new ArrayList<>();
	@OneToMany(mappedBy = "member", cascade = CascadeType.ALL)
	private List<Appointment> appointment = new ArrayList<>();
	
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
		builder.append(", orders=");
		builder.append(orders);
		builder.append(", appointment=");
		builder.append(appointment);
		builder.append("]");
		return builder.toString();
	}
	
}
