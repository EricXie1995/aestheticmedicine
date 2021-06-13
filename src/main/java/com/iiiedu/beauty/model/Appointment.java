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

@Entity
public class Appointment {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer appointmentPkId;
	@ManyToOne
	@JoinColumn(name = "memberPkId")
	private Member member;
	@ManyToOne
	@JoinColumn(name = "clinicPkId")
	private Clinic clinic;
	@ManyToOne
	@JoinColumn(name = "dentistPkId")
	private Dentist dentist;
	private String patientName;
	private String patientIdNumber;
	private String patientPhone;
	private Date appointDate;
	@ManyToOne
	@JoinColumn(name = "timeTablePkId")
	private TimeTable timeTable ;
	@ManyToOne
	@JoinColumn(name = "itemPkId")
	private Items items;
	private String memberReply;
	private String arrive;
	@OneToMany(mappedBy = "appointment", cascade = CascadeType.ALL)
	private List<Comments> comments = new ArrayList<>();
	
	public Appointment() {
	}

	public Integer getAppointmentPkId() {
		return appointmentPkId;
	}

	public void setAppointmentPkId(Integer appointmentPkId) {
		this.appointmentPkId = appointmentPkId;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public Clinic getClinic() {
		return clinic;
	}

	public void setClinic(Clinic clinic) {
		this.clinic = clinic;
	}

	public Dentist getDentist() {
		return dentist;
	}

	public void setDentist(Dentist dentist) {
		this.dentist = dentist;
	}

	public String getPatientName() {
		return patientName;
	}

	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}

	public String getPatientIdNumber() {
		return patientIdNumber;
	}

	public void setPatientIdNumber(String patientIdNumber) {
		this.patientIdNumber = patientIdNumber;
	}

	public String getPatientPhone() {
		return patientPhone;
	}

	public void setPatientPhone(String patientPhone) {
		this.patientPhone = patientPhone;
	}

	public Date getAppointDate() {
		return appointDate;
	}

	public void setAppointDate(Date appointDate) {
		this.appointDate = appointDate;
	}

	public TimeTable getTimetable() {
		return timeTable;
	}

	public void setTimetable(TimeTable timetable) {
		this.timeTable = timetable;
	}

	public Items getItems() {
		return items;
	}

	public void setItems(Items items) {
		this.items = items;
	}

	public String getMemberReply() {
		return memberReply;
	}

	public void setMemberReply(String memberReply) {
		this.memberReply = memberReply;
	}

	public String getArrive() {
		return arrive;
	}

	public void setArrive(String arrive) {
		this.arrive = arrive;
	}

	public List<Comments> getComments() {
		return comments;
	}

	public void setComments(List<Comments> comments) {
		this.comments = comments;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Appointment [appointmentPkId=");
		builder.append(appointmentPkId);
		builder.append(", member=");
		builder.append(member);
		builder.append(", clinic=");
		builder.append(clinic);
		builder.append(", dentist=");
		builder.append(dentist);
		builder.append(", patientName=");
		builder.append(patientName);
		builder.append(", patientIdNumber=");
		builder.append(patientIdNumber);
		builder.append(", patientPhone=");
		builder.append(patientPhone);
		builder.append(", appointDate=");
		builder.append(appointDate);
		builder.append(", timetable=");
		builder.append(timeTable);
		builder.append(", items=");
		builder.append(items);
		builder.append(", memberReply=");
		builder.append(memberReply);
		builder.append(", arrive=");
		builder.append(arrive);
		builder.append(", comments=");
		builder.append(comments);
		builder.append("]");
		return builder.toString();
	}
	
	
	

}
