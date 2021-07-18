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
public class Clinic {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer clinicPkId;
	private String clinicAccount;
	private String clinicPwd;
	private String clinicName;
	private String clinicPhone;
	@ManyToOne
	@JoinColumn(name = "cityPkId")
	private City city;
	@ManyToOne
	@JoinColumn(name = "distPkId")
	private Dist dist;
	private String clinicAddress;
	private String clinicLocation;
	private String clinicImage;
	private Date clinicStartTime;
	private Date clinicEndTime;
	private String clinicStatus;
	@OneToMany(mappedBy = "clinic", cascade = CascadeType.ALL)
	private List<Appointment> appointment = new ArrayList<>();
	@OneToMany(mappedBy = "clinic", cascade = CascadeType.ALL)
	private List<Dentist> dentist = new ArrayList<>();
	
	private String clinicType;
	private String clinicCity;
	private String clinicDist;
	private String BHours;
	
	public Clinic() {
		super();
	}

	public Integer getClinicPkId() {
		return clinicPkId;
	}

	public void setClinicPkId(Integer clinicPkId) {
		this.clinicPkId = clinicPkId;
	}

	public String getClinicAccount() {
		return clinicAccount;
	}

	public void setClinicAccount(String clinicAccount) {
		this.clinicAccount = clinicAccount;
	}

	public String getClinicPwd() {
		return clinicPwd;
	}

	public void setClinicPwd(String clinicPwd) {
		this.clinicPwd = clinicPwd;
	}

	public String getClinicName() {
		return clinicName;
	}

	public void setClinicName(String clinicName) {
		this.clinicName = clinicName;
	}

	public String getClinicPhone() {
		return clinicPhone;
	}

	public void setClinicPhone(String clinicPhone) {
		this.clinicPhone = clinicPhone;
	}

	public City getCity() {
		return city;
	}

	public void setCity(City city) {
		this.city = city;
	}

	public Dist getDist() {
		return dist;
	}

	public void setDist(Dist dist) {
		this.dist = dist;
	}

	public String getClinicAddress() {
		return clinicAddress;
	}

	public void setClinicAddress(String clinicAddress) {
		this.clinicAddress = clinicAddress;
	}

	public String getClinicLocation() {
		return clinicLocation;
	}

	public void setClinicLocation(String clinicLocation) {
		this.clinicLocation = clinicLocation;
	}

	public String getClinicImage() {
		return clinicImage;
	}

	public void setClinicImage(String clinicImage) {
		this.clinicImage = clinicImage;
	}

	public Date getClinicStartTime() {
		return clinicStartTime;
	}

	public void setClinicStartTime(Date clinicStartTime) {
		this.clinicStartTime = clinicStartTime;
	}

	public Date getClinicEndTime() {
		return clinicEndTime;
	}

	public void setClinicEndTime(Date clinicEndTime) {
		this.clinicEndTime = clinicEndTime;
	}

	public String getClinicStatus() {
		return clinicStatus;
	}

	public void setClinicStatus(String clinicStatus) {
		this.clinicStatus = clinicStatus;
	}

	public List<Appointment> getAppointment() {
		return appointment;
	}

	public void setAppointment(List<Appointment> appointment) {
		this.appointment = appointment;
	}

	public List<Dentist> getDentist() {
		return dentist;
	}

	public void setDentist(List<Dentist> dentist) {
		this.dentist = dentist;
	}

	public String getClinicType() {
		return clinicType;
	}

	public void setClinicType(String clinicType) {
		this.clinicType = clinicType;
	}

	public String getClinicCity() {
		return clinicCity;
	}

	public void setClinicCity(String clinicCity) {
		this.clinicCity = clinicCity;
	}

	public String getClinicDist() {
		return clinicDist;
	}

	public void setClinicDist(String clinicDist) {
		this.clinicDist = clinicDist;
	}

	public String getBHours() {
		return BHours;
	}

	public void setBHours(String bHours) {
		BHours = bHours;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Clinic [clinicPkId=");
		builder.append(clinicPkId);
		builder.append(", clinicAccount=");
		builder.append(clinicAccount);
		builder.append(", clinicPwd=");
		builder.append(clinicPwd);
		builder.append(", clinicName=");
		builder.append(clinicName);
		builder.append(", clinicPhone=");
		builder.append(clinicPhone);
		builder.append(", city=");
		builder.append(city);
		builder.append(", dist=");
		builder.append(dist);
		builder.append(", clinicAddress=");
		builder.append(clinicAddress);
		builder.append(", clinicLocation=");
		builder.append(clinicLocation);
		builder.append(", clinicImage=");
		builder.append(clinicImage);
		builder.append(", clinicStartTime=");
		builder.append(clinicStartTime);
		builder.append(", clinicEndTime=");
		builder.append(clinicEndTime);
		builder.append(", clinicStatus=");
		builder.append(clinicStatus);
		builder.append(", appointment=");
		builder.append(appointment);
		builder.append(", dentist=");
		builder.append(dentist);
		builder.append("]");
		return builder.toString();
	}
    
	
}
