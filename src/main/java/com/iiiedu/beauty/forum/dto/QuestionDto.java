package com.iiiedu.beauty.forum.dto;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import com.iiiedu.beauty.model.Type;

public class QuestionDto {
//	private Integer questionPkId;
	@NotBlank(message = "標題不能為空")
    private String title;
	@NotBlank(message = "描述不能為空")
	private String description;
	@NotBlank(message = "標籤不能為空")
	private String tag;
	@NotNull(message = "分類不能為空")
	private Type type;
	
	public QuestionDto() {
	}

//	public Integer getQuestionPkId() {
//		return questionPkId;
//	}
//
//	public void setQuestionPkId(Integer questionPkId) {
//		this.questionPkId = questionPkId;
//	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public Type getType() {
		return type;
	}

	public void setType(Type type) {
		this.type = type;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("QuestionDto [title=");
		builder.append(title);
		builder.append(", description=");
		builder.append(description);
		builder.append(", tag=");
		builder.append(tag);
		builder.append(", type=");
		builder.append(type);
		builder.append("]");
		return builder.toString();
	}
	
	
    
    
}
