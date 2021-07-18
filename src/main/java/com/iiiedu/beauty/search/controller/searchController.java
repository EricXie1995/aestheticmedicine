package com.iiiedu.beauty.search.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.iiiedu.beauty.model.Clinic;
import com.iiiedu.beauty.search.service.SearchService;

@Controller
public class searchController {
	
	@Autowired
	private SearchService searchService;

	@GetMapping("/searchClinicPage")
	private String searchPage() {
		return "search/searchClinic";
	}
	
	@GetMapping("/searchClinic")
	private String searchClinic(
			@RequestParam(required = false) String clinicCity,
			@RequestParam(required = false) String clinicDist,
			@RequestParam(required = false) String likeString,
			@RequestParam(required = false) List<String> gender,
			@PageableDefault(size = 5, sort = { "clinicPkId" }, direction =
			 Sort.Direction.DESC) Pageable pageable,
			Model model) {
		System.out.println(clinicCity+"==========================================");
		System.out.println(likeString+"==========================================");
		System.out.println(clinicDist+"==========================================");
		System.out.println(gender+"gendergendergendergendergendergendergendergendergendergender==========================================");
//		System.out.println();
		String check = "";
		if(gender != null) {
			for (int i = 0; i < gender.size(); i++) {
				if (i == gender.size() - 1) {
					check += gender.get(i) + "";
				} else {
					check += gender.get(i) + "&gender=";
				}
			}
			model.addAttribute("checkType", check);
		}

//		Map<String, Integer> li= new HashMap<>();
//		li.put("totalPages", 1);
		
		
		if(gender!=null && gender.size()==1) {
			Page<Clinic> clinic = searchService.findByCityAndDistAndlikeString1(clinicCity, clinicDist, likeString, gender.get(0),pageable);
			System.out.println("11111111111111111111111111111111111111111111111111");
			model.addAttribute("page", clinic); 
			model.addAttribute("city", clinicCity); 
			model.addAttribute("dist", clinicDist); 
			model.addAttribute("like", likeString); 
		}else if (gender!=null && gender.size()==2) {
			System.out.println("222222222222222222222222222222222222222222222222222");
			Page<Clinic> clinic = searchService.findByCityAndDistAndlikeString2(clinicCity, clinicDist, likeString, gender.get(0),gender.get(1),pageable);
			model.addAttribute("page", clinic); 
			model.addAttribute("city", clinicCity); 
			model.addAttribute("dist", clinicDist); 
			model.addAttribute("like", likeString); 
		}else if (gender!=null && gender.size()==3) {
			System.out.println("33333333333333333333333333333333333333333333333");
			Page<Clinic> clinic = searchService.findByCityAndDistAndlikeString3(clinicCity, clinicDist, likeString, gender.get(0),gender.get(1),gender.get(2),pageable);
			model.addAttribute("page", clinic); 
			model.addAttribute("city", clinicCity); 
			model.addAttribute("dist", clinicDist); 
			model.addAttribute("like", likeString); 
		}else if (clinicCity != null && clinicDist != null && likeString != null) {
			System.out.println("4444444444444444444444444444444444444444444");
			Page<Clinic> clinic = searchService.findByCityAndDistAndlikeString(clinicCity, clinicDist, likeString, pageable);
			model.addAttribute("page", clinic); 
			model.addAttribute("city", clinicCity); 
			model.addAttribute("dist", clinicDist); 
			model.addAttribute("like", likeString); 
//			System.out.println(likeString+"===============================================");
		}else if (clinicCity != null && clinicDist != null && likeString == null) {
			System.out.println("5555555555555555555555555555555555555555555555555");
			Page<Clinic> clinic = searchService.findByCliniccityAndClinicdist(clinicCity, clinicDist, pageable);
			model.addAttribute("page", clinic); 
			model.addAttribute("city", clinicCity); 
			model.addAttribute("dist", clinicDist); 
			model.addAttribute("like", likeString); 
		} 
		else if (clinicCity != null && clinicDist != null && likeString == "") {
			System.out.println("666666666666666666666666666666666666666666666");
			Page<Clinic> clinic = searchService.findALL(pageable);
			model.addAttribute("city", clinicCity); 
			model.addAttribute("dist", clinicDist); 
			model.addAttribute("like", likeString); 
			model.addAttribute("page", clinic); 
		} else {
			System.out.println("7777777777777777777777777777777777777777");
			Page<Clinic> clinic = searchService.findALL(pageable);
			model.addAttribute("city", clinicCity); 
			model.addAttribute("dist", clinicDist); 
			model.addAttribute("like", likeString); 
			model.addAttribute("page", clinic); 
		}
		
//		if(clinicCity != null && clinicDist != null && likeString != null) {
//			Page<Clinic> clinic = searchService.findByCityAndDistAndlikeString(clinicCity, clinicDist, likeString, pageable);
//			model.addAttribute("page", clinic); 
//			System.out.println(likeString+"===============================================");
//		} else {
//			Page<Clinic> clinic = searchService.findALL(pageable);
//			model.addAttribute("page", clinic); 
//		}
		
		return "search/searchClinic";
	}
}
