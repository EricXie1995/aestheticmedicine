package com.iiiedu.beauty.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;

@Entity
public class Product {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
    private String name;
    private String description;
    private String keyWord;
    private int price;
    private int counts;
    private int type;
    
//    @OneToMany(mappedBy = "product", cascade = CascadeType.ALL)
//	private List<ShoppingCar> shoppingCar = new ArrayList<>();
//    
//    @OneToMany(mappedBy = "product", cascade = CascadeType.ALL)
//	private List<Evaluation> evaluation = new ArrayList<>();

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getKeyWord() {
		return keyWord;
	}

	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getCounts() {
		return counts;
	}

	public void setCounts(int counts) {
		this.counts = counts;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

//	public List<ShoppingCar> getShoppingCar() {
//		return shoppingCar;
//	}
//
//	public void setShoppingCar(List<ShoppingCar> shoppingCar) {
//		this.shoppingCar = shoppingCar;
//	}
//
//	public List<Evaluation> getEvaluation() {
//		return evaluation;
//	}
//
//	public void setEvaluation(List<Evaluation> evaluation) {
//		this.evaluation = evaluation;
//	}

}
