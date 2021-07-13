package com.iiiedu.aestheticmedicine;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.iiiedu.beauty.forum.dao.QuestionRepository;
import com.iiiedu.beauty.model.Question;

@SpringBootTest
class AestheticmedicineApplicationTests {
	
	@Autowired
	QuestionRepository questionRepository;

//	@Test
//	void contextLoads() {
//		List<Question> question = questionRepository.findLikeSearch("人", "1", "2");
//		System.out.println(question+"66666666666666666666666666666666666666666666666666666666666666666");
//	}
	
//	@Test
//  public void findArticle() {
//	List<Question> question = questionRepository.findLikeSearch("人", "1", "2");
//	System.out.println(question+"66666666666666666666666666666666666666666666666666666666666666666");
//  }


}
