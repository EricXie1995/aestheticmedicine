package com.iiiedu.beauty.model;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class DentistItem {
	@ManyToOne
	@JoinColumn(name = "dentistPkId")
	private Dentist dentist ;
	@ManyToOne
	@JoinColumn(name = "itemPkId")
	private Items items;
	
	public DentistItem() {
	}

	public Dentist getDentist() {
		return dentist;
	}

	public void setDentist(Dentist dentist) {
		this.dentist = dentist;
	}

	public Items getItems() {
		return items;
	}

	public void setItems(Items items) {
		this.items = items;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("DentistItem [dentist=");
		builder.append(dentist);
		builder.append(", items=");
		builder.append(items);
		builder.append("]");
		return builder.toString();
	}
	
	
}
