package com.iiiedu.beauty.model;

import java.util.ArrayList;
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
public class Dist {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer distPkId;
	@ManyToOne
	@JoinColumn(name = "cityPkId")
	private City city;
	private String distName;
	@OneToMany(mappedBy = "dist", cascade = CascadeType.ALL)
	private List<Clinic> clinic = new ArrayList<>();
	
	public Dist() {
	}

	public Integer getDistPkId() {
		return distPkId;
	}

	public void setDistPkId(Integer distPkId) {
		this.distPkId = distPkId;
	}

	public City getCity() {
		return city;
	}

	public void setCity(City city) {
		this.city = city;
	}

	public String getDistName() {
		return distName;
	}

	public void setDistName(String distName) {
		this.distName = distName;
	}

	public List<Clinic> getClinic() {
		return clinic;
	}

	public void setClinic(List<Clinic> clinic) {
		this.clinic = clinic;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Dist [distPkId=");
		builder.append(distPkId);
		builder.append(", city=");
		builder.append(city);
		builder.append(", distName=");
		builder.append(distName);
		builder.append(", clinic=");
		builder.append(clinic);
		builder.append("]");
		return builder.toString();
	}
	
	
}
