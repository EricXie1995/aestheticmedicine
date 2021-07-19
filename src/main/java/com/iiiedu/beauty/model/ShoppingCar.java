package com.iiiedu.beauty.model;


import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

@Entity
//@IdClass(value=ShoppingCarPriKey.class)
public class ShoppingCar implements Serializable {

//	@Id
//	private int userId;
//	
//	@Id
//    private int productId;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int carId;
	
    private int productPrice;
    private int counts;
    
    @OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "userPkId",nullable = false)
	private UserMain userMain;
    
    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "productPkId",nullable = false)
	private Product product;

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
//
//	public void setProductId(int productId) {
//		this.productId = productId;
//	}

    
    public int getCarId() {
    	return carId;
    }
    
    public void setCarId(int carId) {
    	this.carId = carId;
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

	public UserMain getUserMain() {
		return userMain;
	}

	public void setUserMain(UserMain userMain) {
		this.userMain = userMain;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

}
