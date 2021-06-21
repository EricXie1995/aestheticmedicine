package com.iiiedu.beauty.forum.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.iiiedu.beauty.forum.service.QuestionService;
import com.iiiedu.beauty.model.Question;

@Controller
public class ForumController {

	@Autowired
	private QuestionService questionService;
	
	@GetMapping("/test2")
    public String test2(){
        return "test2";
    }
	
	@GetMapping("/forum")
    public String forum(@PageableDefault(size = 5, sort = { "questionPkId" }, direction = Sort.Direction.DESC) Pageable pagegable, 
    		HttpSession session, Model model){
		//等書偉提供session
//		model.addAttribute("user", session.getAttribute(xxx))
		String user = "aaa";
		session.setAttribute("user", user);
		if(user == null) {
			return "login";
		}
		Page<Question> page = questionService.findAllByPage(pagegable);
		model.addAttribute("page", page);
		return "forum/forum";
    }
}
