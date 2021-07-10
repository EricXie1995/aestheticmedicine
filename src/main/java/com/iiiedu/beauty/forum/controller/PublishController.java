package com.iiiedu.beauty.forum.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.iiiedu.beauty.forum.cache.TagCache;
import com.iiiedu.beauty.forum.dto.QuestionDto;
import com.iiiedu.beauty.forum.dto.TagDto;
import com.iiiedu.beauty.forum.service.QuestionService;
import com.iiiedu.beauty.forum.service.TypeService;
import com.iiiedu.beauty.forum.util.UpdateUtil;
import com.iiiedu.beauty.model.Member;
import com.iiiedu.beauty.model.Question;
import com.iiiedu.beauty.model.Type;

@Controller
public class PublishController {

	@Autowired
	private QuestionService questionService;
	
	@Autowired
	private TypeService typeService;
	
	//等偉書service
//	@Autowired
//	private MemberService memberService;
	
	 @GetMapping("/publish")
	    public String publish(Model model) {
	        //標籤組
	        TagCache tagCache=new TagCache();
	        List<TagDto> tags = tagCache.gettags();
	        model.addAttribute("tags",tags);
	        
	        //分類
	        List<Type> types = typeService.findAll();
	        model.addAttribute("types", types);
	        return "forum/publish";
	    }

	    //新增與更新問題(jpa的save()方法，有帶主鍵值為更新，沒有為新增)
	    @PostMapping("/publish")
	    public String publishquestion(@RequestParam(required = false) Integer quId, 
	    		@Valid QuestionDto questionDto, BindingResult result, HttpSession session, 
	    		Model model) {
	    	//這邊放進model.addAttribute的目的是為了讓前端拿到，原因寫在publish.jsp，按送出的form那裡
	    	model.addAttribute("quId",quId);
	    	//分類，讓前端能拿到
	    	List<Type> types = typeService.findAll();
	        model.addAttribute("types", types);
	    	if (result.hasErrors()) {
	    		return "forum/publish";
	    	}
	    	Question question = null;
	    	//判斷前端表單有帶id過來(不為空)為更新，由於使用save()方法更新，沒有去動到的欄位會變null，所以使用util包裡面寫好的方法來解決
	    	if(quId != null) {
	    		question = questionService.findOne(quId);
	    		UpdateUtil.copyNullProperties(questionDto, question);
	    	//判斷前端表單沒帶id過來(為空)為新增	
	    	} else {
	    		question = new Question();
//	    		question.setQcommentcount(0);
//	    		question.setviewcount(0);
//	    		question.setLike_count(0);
	    		BeanUtils.copyProperties(questionDto, question); 
	    	}
//	    	Question question = new Question();
//	        BeanUtils.copyProperties(questionDto, question); 
	        
//	        可以這樣去抓到外鍵欄位的屬性，因為bean有設多對一到Member member並有getter/setter，這邊寫出來提醒而已，沒作用
//	        question.getMember().getMemberPkId();
	        
            //標籤組
	        TagCache tagCache=new TagCache();
	        List<TagDto> tags = tagCache.gettags();
	        model.addAttribute("tags",tags);

	        
	        //獲取當前登錄用戶的訊息
//	        User user = null;
//	        Cookie[] cookies = request.getCookies();
//	        for (Cookie cookie : cookies) {
//	            if (cookie.getName().equals("token")) {
//	                String token = cookie.getValue();
//	                user = userMapper.findBytoken(token);
//	            }
//	        }
	    	//這裡等偉書的session，抓登錄訊息
	        Member member = (Member)session.getAttribute("member");
	        //抓到目前登錄的ID，設到外鍵memberPkId，等偉書的service寫一個透過id找會員
//	        Member member = memberService.findMemberById(member.getId);
	        question.setMember(member);
	        
	        
	        question.setCreatetime(new Date());

	        questionService.save(question);
	        return "redirect:/forum/-1";
	    }
	    
	    //修改
	    @GetMapping("/publish/{id}")
	    public String edit(@PathVariable Integer id, Model model){
	    	//分類
	    	List<Type> types = typeService.findAll();
	        model.addAttribute("types", types);
	        Question question=questionService.findOne(id);
	        model.addAttribute("question", question);
	        return "forum/publish";
	    }
}
