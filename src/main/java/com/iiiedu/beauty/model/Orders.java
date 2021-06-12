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
public class Orders {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer orderPkId;
	@ManyToOne
	@JoinColumn(name = "memberPkId")
	private Member member;
	private String orderNo;
	private Date orderDate;
	private Integer totalPayment;
	private String receiver;
	private Integer mobilephone;
	private String shipAddress;
	@ManyToOne
	@JoinColumn(name = "couponPkId")
	private Coupon coupon;
	private String orderStatus;
	private String returnReason;
	@OneToMany(mappedBy = "orders", cascade = CascadeType.ALL)
	private List<OrderDetails> orderDetails = new ArrayList<>();
	
	public Orders() {
	}

	public Integer getOrderPkId() {
		return orderPkId;
	}

	public void setOrderPkId(Integer orderPkId) {
		this.orderPkId = orderPkId;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public Integer getTotalPayment() {
		return totalPayment;
	}

	public void setTotalPayment(Integer totalPayment) {
		this.totalPayment = totalPayment;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public Integer getMobilephone() {
		return mobilephone;
	}

	public void setMobilephone(Integer mobilephone) {
		this.mobilephone = mobilephone;
	}

	public String getShipAddress() {
		return shipAddress;
	}

	public void setShipAddress(String shipAddress) {
		this.shipAddress = shipAddress;
	}

	public Coupon getCoupon() {
		return coupon;
	}

	public void setCoupon(Coupon coupon) {
		this.coupon = coupon;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public String getReturnReason() {
		return returnReason;
	}

	public void setReturnReason(String returnReason) {
		this.returnReason = returnReason;
	}

	public List<OrderDetails> getOrderDetails() {
		return orderDetails;
	}

	public void setOrderDetails(List<OrderDetails> orderDetails) {
		this.orderDetails = orderDetails;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Orders [orderPkId=");
		builder.append(orderPkId);
		builder.append(", member=");
		builder.append(member);
		builder.append(", orderNo=");
		builder.append(orderNo);
		builder.append(", orderDate=");
		builder.append(orderDate);
		builder.append(", totalPayment=");
		builder.append(totalPayment);
		builder.append(", receiver=");
		builder.append(receiver);
		builder.append(", mobilephone=");
		builder.append(mobilephone);
		builder.append(", shipAddress=");
		builder.append(shipAddress);
		builder.append(", coupon=");
		builder.append(coupon);
		builder.append(", orderStatus=");
		builder.append(orderStatus);
		builder.append(", returnReason=");
		builder.append(returnReason);
		builder.append(", orderDetails=");
		builder.append(orderDetails);
		builder.append("]");
		return builder.toString();
	}
	
	
}
