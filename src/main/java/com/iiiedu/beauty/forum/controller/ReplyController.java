package com.iiiedu.beauty.forum.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iiiedu.beauty.forum.dto.ReplyDto;
import com.iiiedu.beauty.forum.dto.ResultDto;
import com.iiiedu.beauty.forum.service.QuestionService;
import com.iiiedu.beauty.forum.service.ReplyService;
import com.iiiedu.beauty.member.repository.MemberRepository;
import com.iiiedu.beauty.model.Member;
import com.iiiedu.beauty.model.Reply;

//回覆功能
@Controller
public class ReplyController {
	
	@Autowired
	private ReplyService replyService;
	
	@Autowired
	private QuestionService questionService;
	
	@Autowired
	private MemberRepository memberRepository;

	@ResponseBody
	@RequestMapping(value = "/reply", method = RequestMethod.POST)
	public Object post(@RequestBody Reply reply, HttpSession session) {
			// 把User寫進session
//			Cookie[] cookies = request.getCookies();
//			if (cookies == null) {
//				return "login";
//			}
//			if(session.getAttribute(user) == null) {
//				return "login";
//			}
//			User user = null;
//			for (Cookie cookie : cookies) {
//				if (cookie.getName().equals("token")) {
//					String token = cookie.getValue();
//					user = userMapper.findBytoken(token);
//					if (user != null) {
//						request.getSession().setAttribute("user", user);
//						// 获取未读的消息数量
//						int unreadnum = notificationMapper.getunreadcount(user.getId());
//						request.getSession().setAttribute("unreadnum", unreadnum);
//					}
//					break;
//				}
//			}
			// 把收到的json資料，把評論插入資料庫
			Reply reply1 = new Reply();
			reply1.setParentid(reply.getParentid());
			System.out.println(reply.getContent()+"--------------------------------------------------------");
			reply1.setContent(reply.getContent());
			reply1.setType(reply.getType());
			reply1.setCreatetime(new Date());
			//這裡等偉書的session，抓登錄訊息
	        Member member = (Member)session.getAttribute("member");
	        //抓到目前登錄的ID，設到外鍵memberPkId，等偉書的service寫一個透過id找會員
//	        Member member = memberService.findMemberById(member.getId);
	        reply1.setMember(member);
			replyService.save(reply1);
			
			

			if (reply.getType() == 2) {
				// 把回复评论的通知插入数据库
//				Notification notification = new Notification();
//				notification.setNotifier(comment.getCommentor());
//				Comment comment2 = commentMapper.getparentbyid(commentCreateDto.getParent_id());
//				notification.setReceiver(comment2.getCommentor());
//				notification.setOuterid(commentCreateDto.getParent_id());
//				notification.setType(notificationEnum.NOTIFICATION_COMMENT.getType());
//				notification.setCreatetime(System.currentTimeMillis());
//				notification.setStatus(NotificationStatusEnum.UNREAD.getStatus());
//				notificationMapper.insert(notification);
//
//				// 增加回覆評論的評論數
				replyService.increaserecomment(reply.getParentid());
			} else {
				// 把回复问题的通知插入数据库
//				Question question = questionMapper.getbyId(commentCreateDto.getParent_id());
//				Notification notification = new Notification();
//				notification.setNotifier(user.getId());
//				notification.setReceiver(question.getCreateid());
//				notification.setOuterid(commentCreateDto.getParent_id());
//				notification.setType(notificationEnum.NOTIFICATION_QUESTION.getType());
//				notification.setCreatetime(System.currentTimeMillis());
//				notification.setStatus(NotificationStatusEnum.UNREAD.getStatus());
//				notificationMapper.insert(notification);
				// 增加問題回覆量
				questionService.increasecomment(reply.getParentid());
			}
			ResultDto<?> resultDto = new ResultDto<Object>();
			return resultDto.success();
		}

	    @ResponseBody
	    @RequestMapping(value = "/reply/{id}",method = RequestMethod.GET)
	    public ResultDto<List<Reply>> reply(@PathVariable Integer id,
	                                                HttpSession session){
	        //查找type=2，即是回复评论的评论
	        List<Reply> reply = replyService.findByParIdAndType(id, 2);
	        for (int i = 0; i < reply.size(); i++) {
	        	
	        	reply.get(i).getMember().getMemberName();
	        	reply.get(i).setMemberName(reply.get(i).getMember().getMemberName());
	        	System.out.println(reply.get(i).getMember().getMemberName()+"===================================================");
			}
//	        List<Reply> replyTemp = replyService.findByParIdAndType(id, 2);
	        
//	        List<ReplyDto> replyDto = new ArrayList<>();
	        
//	        Member member = memberRepository.getById(id)
	        		
//	        for (Reply reply1 : reply) {
//	        	String
//				String memberN = reply1.getMember().getMemberName()
		
//	        }		
	        
//	        
//	        for (Reply reply2 : reply) {
//				ReplyDto dto = new ReplyDto();
//				String memberN = reply2.getMember().getMemberName();
//				BeanUtils.copyProperties(reply2, dto);
//				dto.setMemberName(memberN);
//				replyDto.add(dto);
//			}
//	        List<Reply> reply2=new ArrayList<>();
	        //找到User
//	        Cookie[] cookies = request.getCookies();
//	        User user = null;
//	        for (Cookie cookie : cookies) {
//	            if (cookie.getName().equals("token")) {
//	                String token = cookie.getValue();
//	                user = userMapper.findBytoken(token);
//	                break;
//	            }
//	        }
//	        //把二级评论和对应的User写进每个CommentDto集合中
//	        for (Comment comment:comments){
//	            CommentDto dto=new CommentDto();
//	            BeanUtils.copyProperties(comment,dto);
//	            dto.setUser(user);
//	            commentDto.add(dto);
//	        }
	        ResultDto<?> resultDto=new ResultDto<Object>();
	        //返回數據給前端
	        return resultDto.success(reply);
//	    }
	}
}
