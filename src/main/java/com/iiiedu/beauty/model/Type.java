package com.iiiedu.beauty.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotBlank;

@Entity
public class Type {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer typePkId;
	
	@NotBlank(message = "分類名稱不能為空")
	private String typeName;

	@OneToMany(mappedBy = "type", cascade = CascadeType.ALL)
	private List<Question> question = new ArrayList<>();

	public Integer getTypePkId() {
		return typePkId;
	}

	public void setTypePkId(Integer typePkId) {
		this.typePkId = typePkId;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public List<Question> getQuestion() {
		return question;
	}

	public void setQuestion(List<Question> question) {
		this.question = question;
	}

//	@Override
//	public String toString() {
//		StringBuilder builder = new StringBuilder();
//		builder.append("Type [typePkId=");
//		builder.append(typePkId);
//		builder.append(", typeName=");
//		builder.append(typeName);
//		builder.append(", question=");
//		builder.append(question);
//		builder.append("]");
//		return builder.toString();
//	}
	
	
}
