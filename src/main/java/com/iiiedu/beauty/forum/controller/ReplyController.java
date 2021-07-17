package com.iiiedu.beauty.forum.controller;

import java.util.Date;
import java.util.List;

import javax.persistence.Transient;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iiiedu.beauty.forum.dto.ResultDto;
import com.iiiedu.beauty.forum.enums.NotificationStatusEnum;
import com.iiiedu.beauty.forum.enums.notificationEnum;
import com.iiiedu.beauty.forum.service.NotificationService;
import com.iiiedu.beauty.forum.service.QuestionService;
import com.iiiedu.beauty.forum.service.ReplyService;
import com.iiiedu.beauty.member.repository.MemberRepository;
import com.iiiedu.beauty.model.Member;
import com.iiiedu.beauty.model.Notification;
import com.iiiedu.beauty.model.Question;
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
	
	@Autowired
	private NotificationService notificationService;

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
			Member member = (Member) session.getAttribute("member");
			//取得登錄者的未讀消息通知數量
			Integer unreadnum = notificationService.grtUnreadcount(member.getMemberPkId());
			session.setAttribute("unreadnum", unreadnum);
			System.out.println("消息數量:"+unreadnum);
			// 把收到的json資料，把評論插入資料庫
			Reply reply1 = new Reply();
			reply1.setParentid(reply.getParentid());
			System.out.println(reply.getContent()+"--------------------------------------------------------");
			reply1.setContent(reply.getContent());
			reply1.setType(reply.getType());
			reply1.setCreatetime(new Date());


	        //抓到目前登錄的ID，設到外鍵memberPkId，等偉書的service寫一個透過id找會員
//	        Member member = memberService.findMemberById(member.getId);
	        reply1.setMember(member);
			replyService.save(reply1);
			
			

			if (reply.getType() == 2) {
				//把回覆評論的通知插入資料庫
//				Notification notification = new Notification();
//				notification.setNotifier(comment.getCommentor());
//				Comment comment2 = commentMapper.getparentbyid(commentCreateDto.getParent_id());
//				notification.setReceiver(comment2.getCommentor());
//				notification.setOuterid(commentCreateDto.getParent_id());
//				notification.setType(notificationEnum.NOTIFICATION_COMMENT.getType());
//				notification.setCreatetime(System.currentTimeMillis());
//				notification.setStatus(NotificationStatusEnum.UNREAD.getStatus());
//				notificationMapper.insert(notification);
				Notification notification = new Notification();
				//回覆人
				notification.setReply(reply1);
				notification.setCreatetime(new Date());
				notification.setStatus(NotificationStatusEnum.UNREAD.getStatus());
				//找到被回覆評論的人
				//parentid是回覆pkid，找到被回覆評論的人
				Reply reply2 = replyService.findOne(reply1.getParentid());
				notification.setMember(reply2.getMember());
				
				notificationService.save(notification);
				
				
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
				Notification notification = new Notification();
				//回覆人
				notification.setReply(reply1);
				notification.setCreatetime(new Date());
				notification.setStatus(NotificationStatusEnum.UNREAD.getStatus());
				//找到被回覆問題的人
				//parentid是問題pkid，找到被回覆問題的人
				Question question = questionService.findOne(reply1.getParentid());
				notification.setMember(question.getMember());
				notificationService.save(notification);
				
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
	        //查找type=2，即是回覆評論的評論
	        List<Reply> reply = replyService.findByParIdAndType(id, 2);
	        for (int i = 0; i < reply.size(); i++) {
	        	//因為用json傳無法讀到外鍵資料，所以用這樣的方式把memberName set 到 model的Reply 設定好
	        	//@Transient註釋的memberName
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
