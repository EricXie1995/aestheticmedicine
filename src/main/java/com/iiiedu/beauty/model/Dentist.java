package com.iiiedu.beauty.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Dentist {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer dentistPkId;
	@ManyToOne
	@JoinColumn(name = "clinicPkId")
	private Clinic clinic;
	private String dentistName;
	private String dentistImage;
	private String dentistGender;
	@OneToMany(mappedBy = "dentist", cascade = CascadeType.ALL)
	private List<Appointment> appointment = new ArrayList<>();
//	@OneToMany(mappedBy = "dentist")
//	private List<DentistTime> dentistTime = new ArrayList<>();
//	@OneToMany(mappedBy = "dentist")
//	private List<DentistItem> dentistItem = new ArrayList<>();
	@ManyToMany
	@JoinTable(
			name = "DentistItem",
			joinColumns = @JoinColumn(name = "dentistPkId"),	
			inverseJoinColumns = @JoinColumn(name = "itemPkId")
			)
	private List<Items> items = new ArrayList<>();
	@ManyToMany
	@JoinTable(
			name = "DentistTime",
			joinColumns = @JoinColumn(name = "dentistPkId"),	
			inverseJoinColumns = @JoinColumn(name = "timeTablePkId")
			)
	private List<TimeTable> timeTable = new ArrayList<>();
	
	public Dentist() {
	}
	public Integer getDentistPkId() {
		return dentistPkId;
	}
	public void setDentistPkId(Integer dentistPkId) {
		this.dentistPkId = dentistPkId;
	}
	public Clinic getClinic() {
		return clinic;
	}
	public void setClinic(Clinic clinic) {
		this.clinic = clinic;
	}
	public String getDentistName() {
		return dentistName;
	}
	public void setDentistName(String dentistName) {
		this.dentistName = dentistName;
	}
	public String getDentistImage() {
		return dentistImage;
	}
	public void setDentistImage(String dentistImage) {
		this.dentistImage = dentistImage;
	}
	public String getDentistGender() {
		return dentistGender;
	}
	public void setDentistGender(String dentistGender) {
		this.dentistGender = dentistGender;
	}
	public List<Appointment> getAppointment() {
		return appointment;
	}
	public void setAppointment(List<Appointment> appointment) {
		this.appointment = appointment;
	}
	public List<Items> getItem() {
		return items;
	}
	public void setItem(List<Items> item) {
		this.items = item;
	}
	public List<TimeTable> getTimeTable() {
		return timeTable;
	}
	public void setTimeTable(List<TimeTable> timeTable) {
		this.timeTable = timeTable;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Dentist [dentistPkId=");
		builder.append(dentistPkId);
		builder.append(", clinic=");
		builder.append(clinic);
		builder.append(", dentistName=");
		builder.append(dentistName);
		builder.append(", dentistImage=");
		builder.append(dentistImage);
		builder.append(", dentistGender=");
		builder.append(dentistGender);
		builder.append(", appointment=");
		builder.append(appointment);
		builder.append(", item=");
		builder.append(items);
		builder.append(", timeTable=");
		builder.append(timeTable);
		builder.append("]");
		return builder.toString();
	}
	
}
