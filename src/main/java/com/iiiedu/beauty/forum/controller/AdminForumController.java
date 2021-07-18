package com.iiiedu.beauty.forum.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.iiiedu.beauty.forum.service.QuestionService;
import com.iiiedu.beauty.forum.service.TypeService;
import com.iiiedu.beauty.model.Question;
import com.iiiedu.beauty.model.Type;

@Controller
public class AdminForumController {
	@Autowired
	private QuestionService questionService;

	@Autowired
	private TypeService typeService;

	//後臺首頁
	@GetMapping("/adminindex")
	public String adminindex() {
		return "adminindex";
	}
	
	//貼文管理頁面
	@GetMapping("/adminQuestion")
	public String adminQuestion( 
			@RequestParam(required = false) String likeString, 
			@RequestParam(required = false) Integer typId,
			@RequestParam(required = false) String date1, 
			@RequestParam(required = false) String date2, 
			Model model) {
		System.out.println(likeString + "sssssssssssssssssssssssssssssssssssssssssssssssssssssssssss");
		System.out.println(typId + "ttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt");
		System.out.println(date1 + "dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd");
		System.out.println(date2 + "222222222222222222222222222222222222222222222222222222222222222");

		// 讓貼文管理頁面抓到分類顯示出來
		List<Type> types = typeService.findAll();
		model.addAttribute("types", types);
		
		//給前端做判斷是否為空，記著選過的分類
		model.addAttribute("selType", typId);
		
		////給前端做判斷是否為空，記著選過的日期
		model.addAttribute("selDate1", date1);
		model.addAttribute("selDate2", date2);
		
		model.addAttribute("selLikeString", likeString);
		
		//一進貼文管理畫面
		if (likeString == null && typId == null && date1 == null && date2 == null) {
			List<Question> question = questionService.findAllByOrderByCreatetimeDesc();
			model.addAttribute("page", question);
			System.out.println("11111111111111111111111111111111111111111111111111111111111111111111111");
		//搜尋列全部為空時
		} else if (likeString == "" && typId == null &&  date1 == "" && date2 == "") {
//			List<Question> question = questionService.findAllByDate(date1, date2);
			List<Question> question = questionService.findAllByOrderByCreatetimeDesc();
			model.addAttribute("page", question);
			System.out.println("2222222222222222222222222222222222222222222222222222222222222222222");
		//只搜尋日期時
		} else if (likeString == "" && typId == null &&  date1 != "" && date2 != "") {
//			List<Question> question = questionService.findByType(typId);
			List<Question> question = questionService.findAllByDate(date1, date2);
			model.addAttribute("page", question);
			System.out.println("33333333333333333333333333333333333333333333333333333333333333");
		//只搜尋分類時
		} else if (likeString == "" && typId != null &&  date1 == "" && date2 == "") {
//			List<Question> question = questionService.findAllLikeSearch(likeString);
			List<Question> question = questionService.findByType(typId);
			model.addAttribute("page", question);
			System.out.println("4444444444444444444444444444444444444444444444444444444444444444");
		//只搜尋關鍵字時
		} else if (likeString != "" && typId == null &&  date1 == "" && date2 == "") {
			List<Question> question = questionService.findAllLikeSearch(likeString);
			model.addAttribute("page", question);
			System.out.println("55555555555555555555555555555555555555555555555555555555555");
		//搜尋關鍵字、日期、分類時
		} else if (likeString != "" && typId != null &&  date1 != "" && date2 != "") {
			List<Question> question = questionService.findByLikeAndDateAndType(likeString, date1, date2, typId);
			model.addAttribute("page", question);
			System.out.println("666666666666666666666666666666666666666666666666666666666666666");
		//搜尋日期、分類時
		} else if (likeString == "" && typId != null &&  date1 != "" && date2 != "") {
			List<Question> question = questionService.findByDateAndType(date1, date2, typId);
			model.addAttribute("page", question);
			System.out.println("7777777777777777777777777777777777777777777777777777777777777");
		}

		return "forum/adminquestion";
	}
	
	//貼文管理 刪除
	@GetMapping("/admin/question/delete/{queid}")
	public String questionType(@PathVariable Integer queid) {
		questionService.deleteByQuestionPkId(queid);
		return "redirect:/adminQuestion";
	}
	
	//分類管理頁面
	@GetMapping("/adminType")
	public String adminType(Model model) {
		// 讓貼文管理頁面抓到分類顯示出來
		List<Type> types = typeService.findAll();
		model.addAttribute("types", types);
		return "forum/adminType";
	}
	
	//分類管理 新增or修改
	@PostMapping("/adminType/addType")
	public String saveType(@Valid Type type, BindingResult result, Model model) {
		if(result.hasErrors()) {
			return "redirect:/adminType";
		}
		typeService.save(type);
		return "redirect:/adminType";
	}
	
	//刪除分類
	@GetMapping("/adminType/delType/{typId}")
	public String delType(@PathVariable Integer typId) {
		typeService.deleteByTypePkId(typId);
		return "redirect:/adminType";
	}
	
	//分類模糊查詢
	@GetMapping("/adminType/typeSearch")
	public String typeSearch(@RequestParam(required = false) String likeString, Model model) {
		//給前端做判斷是否為空，記著搜尋過的關鍵字
		model.addAttribute("likeString", likeString);
		
		if(likeString == null || likeString == "") {
			List<Type> types = typeService.findAll();
			model.addAttribute("types", types);
		} else {
			List<Type> types = typeService.findTypeLikeSearch(likeString);
			model.addAttribute("types", types);
		}
		return "forum/adminType";
	}
	
	@GetMapping("/admin/question/status")
	public String questionType(@RequestParam Integer queId, @RequestParam Integer sta) {
		if(sta == 1) {
			questionService.updateStatus1(queId);
		} else {
			questionService.updateStatus0(queId);
		}
		return "redirect:/adminQuestion";
	}
	
	//一些套件的測試頁
	@GetMapping("/testt")
	public String adminQuestion() {
		return "forum/test";
	}

}
