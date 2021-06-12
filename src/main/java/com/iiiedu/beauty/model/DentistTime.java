package com.iiiedu.beauty.model;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class DentistTime {
	@ManyToOne
	@JoinColumn(name = "dentistPkId")
	private Dentist dentist;
	@ManyToOne
	@JoinColumn(name = "timeTablePkId")
	private TimeTable timeTable;

}
