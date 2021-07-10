package com.iiiedu.beauty.forum.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.iiiedu.beauty.forum.exception.ResourceNotFoundException;
import com.iiiedu.beauty.forum.service.QuestionService;
import com.iiiedu.beauty.forum.service.TypeService;
import com.iiiedu.beauty.model.Type;

@Controller
public class ChartController {
	
	@Autowired
	private TypeService typeService;
	
	@Autowired
	private QuestionService questionService;

	@RequestMapping(value = "/chart/queCountByTypes", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> getNumsOfPostsByCategories() {
		Map<String, Object> attributes = new HashMap<>();
		List<Type> types = typeService.findAll();
		for (Type type : types) {			
			String typeName = type.getTypeName();
			Integer typeId = type.getTypePkId();
			Integer queCountByType = questionService.findQueCountBYTypId(typeId);
			attributes.put(typeName, queCountByType);
		}
		
		if (attributes == null) {
			throw new ResourceNotFoundException("attributes not found.");
		}
		return ResponseEntity.ok().body(attributes);
	}
	
	@GetMapping("/testt")
	public String test() {
		return "forum/test";
	}

}
