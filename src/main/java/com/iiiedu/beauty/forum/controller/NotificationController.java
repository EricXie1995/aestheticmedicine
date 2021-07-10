package com.iiiedu.beauty.forum.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iiiedu.beauty.forum.dto.ResultDto;
import com.iiiedu.beauty.forum.enums.notificationEnum;
import com.iiiedu.beauty.forum.service.NotificationService;
import com.iiiedu.beauty.forum.service.QuestionService;
import com.iiiedu.beauty.forum.service.ReplyService;
import com.iiiedu.beauty.model.Favorites;
import com.iiiedu.beauty.model.Member;
import com.iiiedu.beauty.model.Notification;
import com.iiiedu.beauty.model.Question;

//將通知設置為已讀，並且跳轉到問題頁面
@Controller
public class NotificationController {

	@Autowired
	private NotificationService notificationService;
	
	@Autowired
	private ReplyService replyService;
		//!!!!!!!!!!!!!!!!!!!!!!
  @GetMapping("/notification/{action}")
  public String notification(@PathVariable("action")Integer id){
      //將通知設置為已讀
//      notificationMapper.updatestatus(id);
	  notificationService.updateStatus(id);
	  //獲取type，檢驗是回復問題還是回覆評論
//	  int type=notificationMapper.gettypebyid(id);
	  Integer type = notificationService.findOne(id).getReply().getType();
      
//      int outerid=notificationMapper.getouteridbyid(id);
//	  找到回復問題id
      Integer qParentid = notificationService.findOne(id).getReply().getParentid();
      System.out.println(qParentid+"zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz");
//	  找到回復回復的問題id，但是不能先在這邊寫，因為如果是type=1的情況會報錯No value present，要寫在下面的else裡
//      Integer rParentid = replyService.findOne(qParentid).getParentid();
//      System.out.println(rParentid);
      Integer questionid;
      if(type== notificationEnum.NOTIFICATION_QUESTION.getType()){ 
          questionid=qParentid;
          
      }else {
//    	  找到回覆回覆的問題id
    	  questionid=replyService.findOne(qParentid).getParentid();
//          questionid=rParentid;
      }
      return "redirect:/question/"+questionid;
  }
  
//	@GetMapping("/notification/clearunread")
//	public String ClearAllUnread(@RequestParam(required = false) Integer notId, HttpSession session) {
//		Member member = (Member) session.getAttribute("member");
//		
//		if(notId == null) {
//			//傳來參數不含通知id，清除目前登錄者所有未讀狀態
//			notificationService.updateAllStatus(member.getMemberPkId());
//		} else {
//			//依指定通知id刪除通知
//			notificationService.updateNotStatus(notId);
//		}
//		return "redirect:/personal/information";
//	}
  
  	@ResponseBody
	@RequestMapping(value = "/notification/clearunread", method = RequestMethod.POST)
	public Object postUpdStatus(@RequestBody(required = false) Notification notification, HttpSession session) {

  		Member member = (Member) session.getAttribute("member");
  		if(notification == null) {
  			notificationService.updateAllStatus(member.getMemberPkId());
  		} else {
  			System.out.println(notification.getNotificationPkId()+"nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn");
  			notificationService.updateNotStatus(notification.getNotificationPkId());
  		}
			ResultDto<?> resultDto = new ResultDto<Object>();
			return resultDto.success();
		}
  	
  	@ResponseBody
	@RequestMapping(value = "/notification/delete", method = RequestMethod.POST)
	public Object postDelNot(@RequestBody(required = false) Notification notification, HttpSession session) {

  		Member member = (Member) session.getAttribute("member");
  		if(notification == null) {
  			notificationService.deleteByMember(member);
  		} else {
  			System.out.println(notification.getNotificationPkId()+"ddddddddddddddddddddddddddddddddddddddddddddddddddd");
  			notificationService.deleteByNotificationPkId(notification.getNotificationPkId());
  		}
			ResultDto<?> resultDto = new ResultDto<Object>();
			return resultDto.success();
		}
	
}