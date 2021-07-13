package com.iiiedu.beauty.forum.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.iiiedu.beauty.forum.dao.QuestionRepository;
import com.iiiedu.beauty.forum.service.QuestionService;
import com.iiiedu.beauty.forum.service.TypeService;
import com.iiiedu.beauty.member.repository.MemberRepository;
import com.iiiedu.beauty.member.security.MemberUserDetails;
import com.iiiedu.beauty.model.Member;
import com.iiiedu.beauty.model.Question;
import com.iiiedu.beauty.model.Type;

@Controller
public class ForumController {

	@Autowired
	private QuestionService questionService;

	@Autowired
	private MemberRepository memberRepository;

	@Autowired
	private TypeService typeService;

	@Autowired
	private QuestionRepository questionRepository;

	@GetMapping("/test2")
	public String test2() {
		return "test2";
	}

	// 論壇首頁
	@GetMapping("/forum/{typId}")
//	@GetMapping(path = {"/forum/{typId}", "/forum"})
	public String forum(@PathVariable Integer typId,
			/*
			 * @PageableDefault/*(size = 5, sort = { "createtime" }, direction =
			 * Sort.Direction.DESC) Pageable pageable,
			 */
			@RequestParam(defaultValue = "0") Integer page, @RequestParam(defaultValue = "createtime") String sort,
			@RequestParam(required = false) String searchQ, @RequestParam(required = false) List<Integer> checkType,
			HttpSession session, Model model, @AuthenticationPrincipal MemberUserDetails user) {

		// 讓論壇首頁抓到分類顯示出來
		List<Type> types = typeService.findAll();
		model.addAttribute("types", types);

		// 記住目前選中的排序傳給前端
		model.addAttribute("sort", sort);

		// 找到登錄者放進session
		Member member = memberRepository.findByMemberAccount(user.getUsername());
		session.setAttribute("member", member);
		
		//未登錄返回登錄頁面
		if (member == null) {
			return "login";
		}
		Page<Question> page1 = null;
//		Page<Question> page2 = null;

		Pageable pageable = PageRequest.of(page, 5, Sort.by(Sort.Direction.DESC, sort));
		System.out.println(searchQ+"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
		System.out.println(checkType+"MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM");
//		System.out.println(checkType.length+"");
		
		//模糊查詢
		if (searchQ != null && searchQ != "") {
			System.out.println(searchQ+"zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
			page1 = questionRepository.findAllLikeSearch(searchQ, pageable);
			model.addAttribute("page", page1);
			model.addAttribute("searchQ", searchQ);
			//模糊查詢帶分類多選條件
			if(checkType!= null && checkType.size()>0) {
				System.out.println(checkType.size()+"進到第二層進到第二層進到第二層進到第二層進到第二層進到第二層進到第二層進到第二層進到第二層進到第二層");
				//這個迴圈是為了讓前端用EL直接用${check}取得get網址列查詢字串
				String check = "";
				for (int i = 0; i < checkType.size(); i++) {
					if (i == checkType.size() - 1) {
						check += checkType.get(i) + "";
					} else {
						check += checkType.get(i) + "&checkType=";
					}
				}
				//這個迴圈是為了讓前端用EL直接用${check2}顯示選中的分類搜尋條件
				String check2 = "";
				Type type;
				for (int i = 0; i < checkType.size(); i++) {
					type = typeService.findOne(checkType.get(i));
					if (i == checkType.size() - 1) {
						check2 += type.getTypeName();
					} else {
						check2 += type.getTypeName() + " / ";
					}
				}
				//呼叫模糊查詢資料庫語句
				if (checkType.size() == 1) {
					page1 = questionRepository.findLikeSearch(searchQ, checkType.get(0), pageable);
				} else if (checkType.size() == 2) {
					page1 = questionRepository.findLikeSearch(searchQ, checkType.get(0), checkType.get(1), pageable);
				} else if (checkType.size() == 3) {
					page1 = questionRepository.findLikeSearch(searchQ, checkType.get(0), checkType.get(1), checkType.get(2), pageable);
				}
				model.addAttribute("page", page1);
				model.addAttribute("searchQ", searchQ);
				model.addAttribute("checkType", check);
				model.addAttribute("seleType", check2); 
			}
		} else if (typId == -1) {
			// 顯示全部
			page1 = questionService.findAllByPage(pageable);
			model.addAttribute("page", page1);
			model.addAttribute("typId", typId);
//			//查詢結果總行數
//			System.out.println(page1.getTotalElements());
//			//按照當前分頁大小，總頁數
//			System.out.println(page1.getTotalPages());
		} else {
			// 照分類顯示
			page1 = questionService.findByType(typId, pageable);
			model.addAttribute("page", page1);
			model.addAttribute("typId", typId);
		}

		return "forum/forum";
	}
	
	
}
