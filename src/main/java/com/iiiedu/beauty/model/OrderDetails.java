package com.iiiedu.beauty.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class OrderDetails {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer orderDetailPkId;
	@ManyToOne
	@JoinColumn(name = "orderPkId")
	private Orders orders;
	@ManyToOne
	@JoinColumn(name = "productPkId")
	private Products products;
	private Integer orderQuantity;
	
	public OrderDetails() {
	}

	public Integer getOrderDetailPkId() {
		return orderDetailPkId;
	}

	public void setOrderDetailPkId(Integer orderDetailPkId) {
		this.orderDetailPkId = orderDetailPkId;
	}

	public Orders getOrders() {
		return orders;
	}

	public void setOrders(Orders orders) {
		this.orders = orders;
	}

	public Products getProducts() {
		return products;
	}

	public void setProducts(Products products) {
		this.products = products;
	}

	public Integer getOrderQuantity() {
		return orderQuantity;
	}

	public void setOrderQuantity(Integer orderQuantity) {
		this.orderQuantity = orderQuantity;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("OrderDetails [orderDetailPkId=");
		builder.append(orderDetailPkId);
		builder.append(", orders=");
		builder.append(orders);
		builder.append(", products=");
		builder.append(products);
		builder.append(", orderQuantity=");
		builder.append(orderQuantity);
		builder.append("]");
		return builder.toString();
	}
	
}
