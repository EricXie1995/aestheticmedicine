package com.iiiedu.beauty.forum.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import com.iiiedu.beauty.member.services.MemberServices;
import com.iiiedu.beauty.model.Member;

@Controller
public class Imagecontroller {
	
	@Autowired MemberServices memberServices;
	
	@PostMapping("/uploadHeadpic")
	public String headpic(Member member) {
		
		
		
		return "forum/forum";
	}
}
