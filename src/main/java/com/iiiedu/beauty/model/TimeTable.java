package com.iiiedu.beauty.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class TimeTable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer timeTablePkId;
	private String weekdays;
	private String times;
	private String timeInterval;
	@OneToMany(mappedBy = "timeTable", cascade = CascadeType.ALL)
	private List<Appointment> appointment = new ArrayList<>();
	@OneToMany(mappedBy = "timeTable", cascade = CascadeType.ALL)
	private List<DentistTime> dentistTime = new ArrayList<>();
	
	public TimeTable() {
	}

	public Integer getTimeTablePkId() {
		return timeTablePkId;
	}

	public void setTimeTablePkId(Integer timeTablePkId) {
		this.timeTablePkId = timeTablePkId;
	}

	public String getWeekdays() {
		return weekdays;
	}

	public void setWeekdays(String weekdays) {
		this.weekdays = weekdays;
	}

	public String getTimes() {
		return times;
	}

	public void setTimes(String times) {
		this.times = times;
	}

	public String getTimeInterval() {
		return timeInterval;
	}

	public void setTimeInterval(String timeInterval) {
		this.timeInterval = timeInterval;
	}

	public List<Appointment> getAppointment() {
		return appointment;
	}

	public void setAppointment(List<Appointment> appointment) {
		this.appointment = appointment;
	}

	public List<DentistTime> getDentistTime() {
		return dentistTime;
	}

	public void setDentistTime(List<DentistTime> dentistTime) {
		this.dentistTime = dentistTime;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("TimeTable [timeTablePkId=");
		builder.append(timeTablePkId);
		builder.append(", weekdays=");
		builder.append(weekdays);
		builder.append(", times=");
		builder.append(times);
		builder.append(", timeInterval=");
		builder.append(timeInterval);
		builder.append(", appointment=");
		builder.append(appointment);
		builder.append(", dentistTime=");
		builder.append(dentistTime);
		builder.append("]");
		return builder.toString();
	}
	
}
