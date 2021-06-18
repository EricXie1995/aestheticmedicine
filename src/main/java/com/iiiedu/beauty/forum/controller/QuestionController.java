package com.iiiedu.beauty.forum.controller;


import java.util.Date;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.iiiedu.beauty.forum.dto.QuestionDto;
import com.iiiedu.beauty.forum.service.QuestionService;
import com.iiiedu.beauty.model.Question;

@Controller
public class QuestionController {
	
	@Autowired
	private QuestionService questionService;
	//等偉書service
//	@Autowired
//	private MemberService memberService;
	
	 @GetMapping("/publish")
	    public String publish(Model model) {
	        //標籤組
//	        TagCache tagCache=new TagCache();
//	        List<TagDto> tags = tagCache.gettags();
//	        model.addAttribute("tags",tags);
	        return "publish";
	    }

	    //發佈問題
	    @PostMapping("/publish")
	    public String publishquestion(@Valid QuestionDto questionDto, BindingResult result, HttpSession session, 
	    		Model model) {
	    	if (result.hasErrors()) {
	    		System.out.println("----------------------------------------------------------------");
	    		model.addAttribute("result", result);
	    		return "publish";
	    	}
	    	Question question = new Question();
	        BeanUtils.copyProperties(questionDto, question);

	    	
//	        model.addAttribute("title", title);
//	        model.addAttribute("description", description);
//	        model.addAttribute("tag", tag);
	        //標籤組
//	        TagCache tagCache=new TagCache();
//	        List<TagDto> tags = tagCache.gettags();
//	        model.addAttribute("tags",tags);

	        
	        //獲取當前登錄用戶的訊息
//	        User user = null;
//	        Cookie[] cookies = request.getCookies();
//	        for (Cookie cookie : cookies) {
//	            if (cookie.getName().equals("token")) {
//	                String token = cookie.getValue();
//	                user = userMapper.findBytoken(token);
//	            }
//	        }
	    	//這裡等偉書的session
//	        Member member = (Member)session.getAttribute("XXX");
	    	
	        //將問題上傳到資料庫
	        
//	        question.setTitle(title);
//	        question.setDescription(description);
//	        question.setTag(tag);
//	        question.setCreateid(user.getId());
	        //抓到目前登錄的ID，設到外鍵memberPkId，等偉書的service寫一個透過id找會員
//	        Member member = memberService.findMember(member.getId);
//	        question.setMember(member.);
	        question.setCreatetime(new Date());
//	        if(id==-1){
//	            questionMapper.createquestion(question);
//	        }else {
//	            question.setId(id);
//	            questionMapper.updatequestion(question);
//	        }
	        questionService.save(question);
	        return "redirect:/forum";
	    }

//	    @GetMapping("/publish/{id}")
//	    public String edit(@PathVariable(name = "id")int id,
//	                       Model model){
//	        Question question=questionMapper.getbyId(id);
//	        model.addAttribute("title", question.getTitle());
//	        model.addAttribute("description", question.getDescription());
//	        model.addAttribute("tag", question.getTag());
//	        //用来标识问题是修改而不是重新创建
//	        model.addAttribute("id",question.getId());
//	        return "publish";
//	    }

}
