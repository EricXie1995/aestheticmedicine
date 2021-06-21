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

import com.iiiedu.beauty.forum.cache.TagCache;
import com.iiiedu.beauty.forum.dto.QuestionDto;
import com.iiiedu.beauty.forum.dto.TagDto;
import com.iiiedu.beauty.forum.service.QuestionService;
import com.iiiedu.beauty.model.Question;

@Controller
public class PublishController {

	@Autowired
	private QuestionService questionService;
	//等偉書service
//	@Autowired
//	private MemberService memberService;
	
	 @GetMapping("/publish")
	    public String publish(Model model) {
	        //標籤組
	        TagCache tagCache=new TagCache();
	        List<TagDto> tags = tagCache.gettags();
	        model.addAttribute("tags",tags);
	        return "forum/publish";
	    }

	    //發佈問題
	    @PostMapping("/publish")
	    public String publishquestion(@Valid QuestionDto questionDto, BindingResult result, HttpSession session, 
	    		Model model) {
	    	
	    	if (result.hasErrors()) {
	    		return "publish";
	    	}
	    	System.out.println(questionDto.getQuestionPkId()+"--------------------------------------------");
	    	Question question = new Question();
	        BeanUtils.copyProperties(questionDto, question); 
	        
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
//	        Member member = (Member)session.getAttribute("XXX");
	        //抓到目前登錄的ID，設到外鍵memberPkId，等偉書的service寫一個透過id找會員
//	        Member member = memberService.findMemberById(member.getId);
//	        question.setMember(member.);
	        
	        question.setCreatetime(new Date());

	        questionService.save(question);
	        return "redirect:/forum";
	    }
	    
	    //修改
	    @GetMapping("/publish/{id}")
	    public String edit(@PathVariable Integer id, Model model){
	        Question question=questionService.findOne(id);
	        model.addAttribute("question", question);
	        return "forum/publish";
	    }
}
