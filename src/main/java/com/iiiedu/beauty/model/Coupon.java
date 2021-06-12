package com.iiiedu.beauty.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Coupon {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer couponPkId;
	private String couponName;
	private Double couponContext;
	private String couponCode;
	private Date couponStartTime;
	private Date couponEndTime;
	private String couponStatus;
	@OneToMany(mappedBy = "coupon", cascade = CascadeType.ALL)
	private List<Orders> orders = new ArrayList<>();
	
	public Coupon() {
	}

	public Integer getCouponPkId() {
		return couponPkId;
	}

	public void setCouponPkId(Integer couponPkId) {
		this.couponPkId = couponPkId;
	}

	public String getCouponName() {
		return couponName;
	}

	public void setCouponName(String couponName) {
		this.couponName = couponName;
	}

	public Double getCouponContext() {
		return couponContext;
	}

	public void setCouponContext(Double couponContext) {
		this.couponContext = couponContext;
	}

	public String getCouponCode() {
		return couponCode;
	}

	public void setCouponCode(String couponCode) {
		this.couponCode = couponCode;
	}

	public Date getCouponStartTime() {
		return couponStartTime;
	}

	public void setCouponStartTime(Date couponStartTime) {
		this.couponStartTime = couponStartTime;
	}

	public Date getCouponEndTime() {
		return couponEndTime;
	}

	public void setCouponEndTime(Date couponEndTime) {
		this.couponEndTime = couponEndTime;
	}

	public String getCouponStatus() {
		return couponStatus;
	}

	public void setCouponStatus(String couponStatus) {
		this.couponStatus = couponStatus;
	}

	public List<Orders> getOrders() {
		return orders;
	}

	public void setOrders(List<Orders> orders) {
		this.orders = orders;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Coupon [couponPkId=");
		builder.append(couponPkId);
		builder.append(", couponName=");
		builder.append(couponName);
		builder.append(", couponContext=");
		builder.append(couponContext);
		builder.append(", couponCode=");
		builder.append(couponCode);
		builder.append(", couponStartTime=");
		builder.append(couponStartTime);
		builder.append(", couponEndTime=");
		builder.append(couponEndTime);
		builder.append(", couponStatus=");
		builder.append(couponStatus);
		builder.append(", orders=");
		builder.append(orders);
		builder.append("]");
		return builder.toString();
	}
	
}
