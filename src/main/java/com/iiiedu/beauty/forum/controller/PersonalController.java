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
import org.springframework.web.bind.annotation.PathVariable;

import com.iiiedu.beauty.forum.dao.NotificationRepository;
import com.iiiedu.beauty.forum.service.NotificationService;
import com.iiiedu.beauty.forum.service.QuestionService;
import com.iiiedu.beauty.model.Member;
import com.iiiedu.beauty.model.Notification;
import com.iiiedu.beauty.model.Question;

@Controller
public class PersonalController {
	
	@Autowired
	private QuestionService questionService;
	
	@Autowired
	private NotificationService notificationService;

	@GetMapping("/personal/{action}")
    public String personal(@PathVariable String action,
                           Model model,
                           HttpSession session,
                           @PageableDefault(size = 5, sort = { "createtime" }, direction = Sort.Direction.DESC) Pageable pagegable){
//        Cookie[] cookies = request.getCookies();
//        if (cookies == null) {
//            return "login";
//        }
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
		//等書偉提供session替代上面，在forumcontroller這邊先隨便設定一個session
		Member member = (Member) session.getAttribute("member");
		Integer userId = member.getMemberPkId(); //先暫時這樣當抓到登陸的Id，到時候要改成member.getgetMemberPkId()
		
        if (action.equals("questions")){
            model.addAttribute("section","questions");
            model.addAttribute("sectionname","我的問題");
            Page<Question> page = questionService.findByMemIdToQues(userId, pagegable);
//            PageDto<Question> pagination=questionService.list(user.getId(),page,size);
            model.addAttribute("page", page);
        }else if (action.equals("information")){
            model.addAttribute("section","information");
            model.addAttribute("sectionname","我的消息");
            Page<Notification> page = notificationService.findByMemIdToNoti(userId, pagegable);
//            PageDto<NotificationDto> notifications= notificationService.list(user.getId(),page,size);
            model.addAttribute("page", page);
        }

        return "forum/personal";
    }
	
	@GetMapping("/personal2")
	public String personal2() {
		return "forum/personal2";
	}
}
