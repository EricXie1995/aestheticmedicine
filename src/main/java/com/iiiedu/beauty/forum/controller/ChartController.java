package com.iiiedu.beauty.forum.controller;

import java.time.Month;
import java.time.format.TextStyle;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
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
	
	@RequestMapping(value = "/chart/queCountByMonth", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> getNumsOfPostsBymonths() {
		Map<String, Object> attributes = new HashMap<>();
		List<Integer> queNumList = new ArrayList<>();
		List<String> monthsList = new ArrayList<>();
		int currMonth = Calendar.getInstance().get(Calendar.MONTH);
		for (int i = currMonth; i < currMonth + 12; i++) {
			Month month = Month.values()[i < 11 ? i + 1 : i - 11]; // January = 0
			Integer queCountByMonth = questionService.findQueCountByMonth(month.getValue());
//			System.out.println(month.getValue()+"mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm");
//			System.out.println(queCountByMonth+"cccccccccccccccccccccccccccccccccccccccccccccccccc");
			queNumList.add(queCountByMonth);
			monthsList.add(month.getDisplayName(TextStyle.FULL, Locale.CHINESE));
//			System.out.println(month.getDisplayName(TextStyle.FULL, Locale.CHINESE)+"hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh");
		}
		attributes.put("queNumList", queNumList);
		attributes.put("monthsList", monthsList);
		
		if (null == attributes) {
			throw new ResourceNotFoundException("attributes not found.");
		}
		return ResponseEntity.ok().body(attributes);
	}
	
	@GetMapping("/adminForumChart")
	public String test() {
		return "forum/adminchart";
	}

}
