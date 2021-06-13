//package com.iiiedu.beauty.model;
//
//import javax.persistence.Entity;
//import javax.persistence.JoinColumn;
//import javax.persistence.ManyToOne;
//
//@Entity
//public class DentistTime {
//	@ManyToOne
//	@JoinColumn(name = "dentistPkId")
//	private Dentist dentist;
//	@ManyToOne
//	@JoinColumn(name = "timeTablePkId")
//	private TimeTable timeTable;
//	
//	public DentistTime() {
//	}
//
//	public Dentist getDentist() {
//		return dentist;
//	}
//
//	public void setDentist(Dentist dentist) {
//		this.dentist = dentist;
//	}
//
//	public TimeTable getTimeTable() {
//		return timeTable;
//	}
//
//	public void setTimeTable(TimeTable timeTable) {
//		this.timeTable = timeTable;
//	}
//
//	@Override
//	public String toString() {
//		StringBuilder builder = new StringBuilder();
//		builder.append("DentistTime [dentist=");
//		builder.append(dentist);
//		builder.append(", timeTable=");
//		builder.append(timeTable);
//		builder.append("]");
//		return builder.toString();
//	}
//	
//}
