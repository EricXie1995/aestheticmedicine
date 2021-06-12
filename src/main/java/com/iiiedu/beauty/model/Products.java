package com.iiiedu.beauty.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Products {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer productPkId;
	private String productName;
	private String productUpdateDate;
	private Integer productPrice;
	private Integer productQuantity;
	private String productStatus;
	private String productImage;
	private String productCategory;
	private String productProfile;
	private String productSpec;
	@OneToMany(mappedBy = "products", cascade = CascadeType.ALL)
	private List<OrderDetails> orderDetails = new ArrayList<>();
	
	public Products() {
	}

	public Integer getProductPkId() {
		return productPkId;
	}

	public void setProductPkId(Integer productPkId) {
		this.productPkId = productPkId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductUpdateDate() {
		return productUpdateDate;
	}

	public void setProductUpdateDate(String productUpdateDate) {
		this.productUpdateDate = productUpdateDate;
	}

	public Integer getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(Integer productPrice) {
		this.productPrice = productPrice;
	}

	public Integer getProductQuantity() {
		return productQuantity;
	}

	public void setProductQuantity(Integer productQuantity) {
		this.productQuantity = productQuantity;
	}

	public String getProductStatus() {
		return productStatus;
	}

	public void setProductStatus(String productStatus) {
		this.productStatus = productStatus;
	}

	public String getProductImage() {
		return productImage;
	}

	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}

	public String getProductCategory() {
		return productCategory;
	}

	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}

	public String getProductProfile() {
		return productProfile;
	}

	public void setProductProfile(String productProfile) {
		this.productProfile = productProfile;
	}

	public String getProductSpec() {
		return productSpec;
	}

	public void setProductSpec(String productSpec) {
		this.productSpec = productSpec;
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
		builder.append("Products [productPkId=");
		builder.append(productPkId);
		builder.append(", productName=");
		builder.append(productName);
		builder.append(", productUpdateDate=");
		builder.append(productUpdateDate);
		builder.append(", productPrice=");
		builder.append(productPrice);
		builder.append(", productQuantity=");
		builder.append(productQuantity);
		builder.append(", productStatus=");
		builder.append(productStatus);
		builder.append(", productImage=");
		builder.append(productImage);
		builder.append(", productCategory=");
		builder.append(productCategory);
		builder.append(", productProfile=");
		builder.append(productProfile);
		builder.append(", productSpec=");
		builder.append(productSpec);
		builder.append(", orderDetails=");
		builder.append(orderDetails);
		builder.append("]");
		return builder.toString();
	}
	
}
