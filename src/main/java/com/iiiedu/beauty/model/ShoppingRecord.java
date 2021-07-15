package com.iiiedu.beauty.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
//@IdClass(value=ShoppingRecordPriKey.class)
public class ShoppingRecord {

//	@Id
//	private int userId;
//	
//	@Id
//    private int productId;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int recordId;
	
    private String time;
    private int orderStatus;
    private int productPrice;
    private int counts;
    
    @ManyToOne
    @JoinColumn(name = "productPkId",nullable = false)
	private Product product;
    
    @ManyToOne
    @JoinColumn(name = "userPkId",nullable = false)
	private UserMain userMain;

//	public int getUserId() {
//		return userId;
//	}
//
//	public void setUserId(int userId) {
//		this.userId = userId;
//	}
//
//	public int getProductId() {
//		return productId;
//	}

//	public void setProductId(int productId) {
//		this.productId = productId;
//	}

    
    
    public int getRecordId() {
    	return recordId;
    }
    
    public void setRecordId(int recordId) {
    	this.recordId = recordId;
    }
    
	public String getTime() {
		return time;
	}


	public void setTime(String time) {
		this.time = time;
	}

	public int getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(int orderStatus) {
		this.orderStatus = orderStatus;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public int getCounts() {
		return counts;
	}

	public void setCounts(int counts) {
		this.counts = counts;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public UserMain getUserMain() {
		return userMain;
	}

	public void setUserMain(UserMain userMain) {
		this.userMain = userMain;
	}

}
