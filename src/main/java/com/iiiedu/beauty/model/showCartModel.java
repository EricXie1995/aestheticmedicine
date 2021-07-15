package com.iiiedu.beauty.model;

import java.sql.Blob;

public class showCartModel {
	public int cartId;
	public int memberPkId;
	public int productPkId;
    public int count;
    public int price;
    public String productName;
    public Blob image;
    public String productSpec;
	public int getCartId() {
		return cartId;
	}
	public int getMemberPkId() {
		return memberPkId;
	}
	public int getProductPkId() {
		return productPkId;
	}
	public int getCount() {
		return count;
	}
	public int getPrice() {
		return price;
	}
	public String getProductName() {
		return productName;
	}
	public Blob getImage() {
		return image;
	}
	public String getProductSpec() {
		return productSpec;
	}

}
