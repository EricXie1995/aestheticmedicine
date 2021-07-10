package com.iiiedu.beauty.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "Items")
public class Items {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer itemPkId;
	private String itemName;
	@OneToMany(mappedBy = "items", cascade = CascadeType.ALL)
	private List<Appointment> appointment = new ArrayList<>();
//	@OneToMany(mappedBy = "items")
//	private List<DentistItem> dentistItem = new ArrayList<>();
	@ManyToMany(mappedBy = "items")
	private List<Dentist> dentist = new ArrayList<>();
	
	public Items() {
	}
	public Integer getItemPkId() {
		return itemPkId;
	}
	public void setItemPkId(Integer itemPkId) {
		this.itemPkId = itemPkId;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
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
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Items [itemPkId=");
		builder.append(itemPkId);
		builder.append(", itemName=");
		builder.append(itemName);
		builder.append(", appointment=");
		builder.append(appointment);
		builder.append(", dentist=");
		builder.append(dentist);
		builder.append("]");
		return builder.toString();
	}
	
	
	
}
