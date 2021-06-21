package com.iiiedu.beauty.forum.dto;

import javax.validation.constraints.NotBlank;

public class QuestionDto {
	private Integer questionPkId;
	@NotBlank(message = "標題不能為空")
    private String title;
	@NotBlank(message = "描述不能為空")
	private String description;
	@NotBlank(message = "標籤不能為空")
	private String tag;
    
	public QuestionDto() {
	}

	public Integer getQuestionPkId() {
		return questionPkId;
	}

	public void setQuestionPkId(Integer questionPkId) {
		this.questionPkId = questionPkId;
	}

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
    
    
}
