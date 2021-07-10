package com.iiiedu.beauty.forum.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.iiiedu.beauty.forum.service.FavoritesService;
import com.iiiedu.beauty.forum.service.NotificationService;
import com.iiiedu.beauty.forum.service.QuestionService;
import com.iiiedu.beauty.forum.service.ReplyService;
import com.iiiedu.beauty.model.Favorites;
import com.iiiedu.beauty.model.Member;
import com.iiiedu.beauty.model.Notification;
import com.iiiedu.beauty.model.Question;

@Controller
public class PersonalController {
	
	@Autowired
	private QuestionService questionService;
	
	@Autowired
	private NotificationService notificationService;
	
	@Autowired
	private ReplyService replyService;
	
	@Autowired
	private FavoritesService favoritesService;

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
		
		Member member = (Member) session.getAttribute("member");
//		Integer unreadnum = (Integer) session.getAttribute("unreadnum");
		//取得登錄者的未讀消息通知數量
		Integer unreadnum = notificationService.grtUnreadcount(member.getMemberPkId());
		//這邊再set一次session是為了讓前端抓到最新的未讀數量
		session.setAttribute("unreadnum", unreadnum);
		
		//這裡主要是為了在前端能夠秀出不管消息是來自回覆文章或回覆留言都要抓到對應的文章標題
		List<Notification> notification = notificationService.findAll();
		for (int i = 0; i < notification.size(); i++) {
			//回復文章
			if(notification.get(i).getReply().getType() == 1) {
				//reply的parId就是文章id，透過parId找到文章
				Integer queId = notification.get(i).getReply().getParentid();
				//文章 set 到 notification的question裡
				notification.get(i).setQuestion(questionService.findOne(queId));
				//回覆回覆
			} else if(notification.get(i).getReply().getType() == 2) {
				//reply的parid是被回覆回覆的id也就是replyPkId，所以先找到replyPkId
				Integer replyPkId = notification.get(i).getReply().getParentid();
				//再從replyPkId找到parid，才是queid，再找到文章
				Integer queId = replyService.findOne(replyPkId).getParentid();
				//文章 set 到 notification的question屬性裡
				notification.get(i).setQuestion(questionService.findOne(queId));
				//找到當初自己對某篇問題的留言內容，因為要在個人消息頁面顯示出來某某對你在某文章下的"哪一個留言"進行回覆)
				String selfReplyContent = replyService.findOne(replyPkId).getContent();
				//自己對某篇問題的留言內容 set 到 notification的selfReplyContent屬性裡
				notification.get(i).setSelfReplyContent(selfReplyContent);
			}
		}
		
		//等書偉提供session替代上面，在forumcontroller這邊先隨便設定一個session
//		Member member = (Member) session.getAttribute("member");
		Integer userId = member.getMemberPkId();
				
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
        }else if (action.equals("favorites")) {
        	model.addAttribute("section","favorites");
            model.addAttribute("sectionname","我的收藏");
            //透過member找到收藏文章
            Page<Favorites> page = favoritesService.findByMember(member, pagegable);
            model.addAttribute("page", page);
            System.out.println(page+"cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc");
        }

        return "forum/personal";
    }
	
	@GetMapping("/personal2")
	public String personal2() {
		return "forum/personal2";
	}
}
