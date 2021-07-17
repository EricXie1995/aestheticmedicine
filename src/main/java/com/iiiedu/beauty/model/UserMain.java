package com.iiiedu.beauty.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;


@Entity
public class UserMain {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
    private String name;
    private String email;
    private String nickName;
    private int role;
    
    
//    @OneToOne(mappedBy = "userMain")
//	private UserDetail userDetail;
//    
//    @OneToOne(mappedBy = "userMain")
//    private ShoppingCar shoppingCar;
//    
//    @OneToMany(mappedBy = "userMain", cascade = CascadeType.ALL)
//    private List<ShoppingRecord> shoppingRecord = new ArrayList<>();
//    
//    @OneToMany(mappedBy = "userMain", cascade = CascadeType.ALL)
//    private List<Evaluation> evaluation = new ArrayList<>();

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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public int getRole() {
		return role;
	}

	public void setRole(int role) {
		this.role = role;
	}

//	public UserDetail getUserDetail() {
//		return userDetail;
//	}
//
//	public void setUserDetail(UserDetail userDetail) {
//		this.userDetail = userDetail;
//	}
//
//	public ShoppingCar getShoppingCar() {
//		return shoppingCar;
//	}
//
//	public void setShoppingCar(ShoppingCar shoppingCar) {
//		this.shoppingCar = shoppingCar;
//	}
//
//	public List<ShoppingRecord> getShoppingRecord() {
//		return shoppingRecord;
//	}
//
//	public void setShoppingRecord(List<ShoppingRecord> shoppingRecord) {
//		this.shoppingRecord = shoppingRecord;
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
