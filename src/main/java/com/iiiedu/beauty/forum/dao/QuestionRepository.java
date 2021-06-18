package com.iiiedu.beauty.forum.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.iiiedu.beauty.model.Question;

public interface QuestionRepository extends JpaRepository<Question, Integer>{

}
