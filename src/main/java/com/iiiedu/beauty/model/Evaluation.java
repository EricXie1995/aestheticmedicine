package com.iiiedu.beauty.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
//@IdClass(value=ShoppingRecordPriKey.class)
public class Evaluation {
	
	@Id
	private int evaId;
	
//	@Id
//	private int userId;
//	
//	@Id
//    private int productId;
	
    private String time;
    private String content;
    
    @ManyToOne
    @JoinColumn(name = "userPkId",nullable = false)
	private UserMain userMain;
    
    @ManyToOne
    @JoinColumn(name = "productPkId",nullable = false)
	private Product product;

	public int getEvaId() {
		return evaId;
	}

	public void setEvaId(int evaId) {
		this.evaId = evaId;
	}

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

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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
