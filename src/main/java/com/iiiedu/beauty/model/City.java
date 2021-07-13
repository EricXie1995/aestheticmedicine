package com.iiiedu.beauty.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIdentityReference;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name = "City")
public class City {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer cityPkId;
	private String cityName;
	@OneToMany(mappedBy = "city", cascade = CascadeType.ALL)
	private List<Clinic> clinic = new ArrayList<>();
	@OneToMany(mappedBy = "city", cascade = CascadeType.ALL)
	private List<Dist> dist = new ArrayList<>();
	
	public City() {
	}

	public Integer getCityPkId() {
		return cityPkId;
	}

	public void setCityPkId(Integer cityPkId) {
		this.cityPkId = cityPkId;
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public List<Clinic> getClinic() {
		return clinic;
	}

	public void setClinic(List<Clinic> clinic) {
		this.clinic = clinic;
	}

	public List<Dist> getDist() {
		return dist;
	}

	public void setDist(List<Dist> dist) {
		this.dist = dist;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("City [cityPkId=");
		builder.append(cityPkId);
		builder.append(", cityName=");
		builder.append(cityName);
		builder.append(", clinic=");
		builder.append(clinic);
		builder.append(", dist=");
		builder.append(dist);
		builder.append("]");
		return builder.toString();
	}
	
	
}
