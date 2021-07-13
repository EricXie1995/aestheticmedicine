package com.iiiedu.beauty.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Cart {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int cartId;
    private int memberPkId;
    private int productPkId;
    private int count;
    private int price;
    private String productName;
	public int getCartId() {
		return cartId;
	}
	public void setCartId(int cartId) {
		this.cartId = cartId;
	}
	public int getMemberPkId() {
		return memberPkId;
	}
	public void setMemberPkId(int memberPkId) {
		this.memberPkId = memberPkId;
	}
	public int getProductPkId() {
		return productPkId;
	}
	public void setProductPkId(int productPkId) {
		this.productPkId = productPkId;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	
	public Cart(int cartId, int memberPkId, int productPkId, int count, int price, String productName) {
		this.cartId = cartId;
		this.memberPkId = memberPkId;
		this.productPkId = productPkId;
		this.count = count;
		this.price = price;
		this.productName = productName;
	}
	
	public Cart() {
		super();
	}
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Cart [cartId=");
		builder.append(cartId);
		builder.append(", memberPkId=");
		builder.append(memberPkId);
		builder.append(", productPkId=");
		builder.append(productPkId);
		builder.append(", count=");
		builder.append(count);
		builder.append(", price=");
		builder.append(price);
		builder.append(", productName=");
		builder.append(productName);
		builder.append("]");
		return builder.toString();
	}
	
    
    
}
