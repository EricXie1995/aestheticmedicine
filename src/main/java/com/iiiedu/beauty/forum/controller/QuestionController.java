package com.iiiedu.beauty.forum.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.iiiedu.beauty.forum.dao.ReplyRepository;
import com.iiiedu.beauty.forum.service.QuestionService;
import com.iiiedu.beauty.forum.service.ReplyService;
import com.iiiedu.beauty.forum.service.TypeService;
import com.iiiedu.beauty.model.Question;
import com.iiiedu.beauty.model.Reply;
import com.iiiedu.beauty.model.Type;

@Controller
public class QuestionController {
	
	@Autowired
	private QuestionService questionService;
	
	@Autowired
	private ReplyService replyService;
	
	@Autowired
	private TypeService typeService;

	
	@GetMapping("/question/{id}")
    public String question(@PathVariable Integer id,
                           Model model,
                           HttpSession session){
        //查找cookies，觀察是否有token存在
//        Cookie[] cookies = request.getCookies();
//        if (cookies == null) {
//            return "login";
//        }
		//等書偉提供session
//		String user = "aaa";
//		session.setAttribute("user", user);
//		if(session.getAttribute(xxx) == null) {
//			return "login";
//		}
//        User user = null;
//        for (Cookie cookie : cookies) {
//            if (cookie.getName().equals("token")) {
//                String token = cookie.getValue();
//                user = userMapper.findBytoken(token);
//                if (user != null) {
//                    request.getSession().setAttribute("user", user);
//                    //获取未读的消息数量
//                    int unreadnum=notificationMapper.getunreadcount(user.getId());
//                    request.getSession().setAttribute("unreadnum",unreadnum);
//                }
//                break;
//            }
//        }
//        Questiondto questiondto=questionService.getbyid(id);
		
		
		Question question = questionService.findOne(id);
        //增加閱讀數
        questionService.increaseview(id);
        model.addAttribute("question",question);
        //展示回復數據
        List<Reply> reply =replyService.findByParentid(id);
        model.addAttribute("reply",reply);
        //相關問題
//        String[] tags=questiondto.getTag().split(",");
//        StringBuilder msg=new StringBuilder();
//        for (String tag:tags){
//            msg.append(tag);
//            msg.append("|");
//        }
//        String result=msg.substring(0,msg.length()-1);
//        List<Question> relativequestion =questionService.getbytag(id,result);
//        model.addAttribute("relativequestion",relativequestion);

        return "forum/question";
    }

}
