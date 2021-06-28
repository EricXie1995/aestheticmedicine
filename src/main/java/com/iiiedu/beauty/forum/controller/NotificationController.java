package com.iiiedu.beauty.forum.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.iiiedu.beauty.forum.enums.notificationEnum;
import com.iiiedu.beauty.forum.service.NotificationService;
import com.iiiedu.beauty.forum.service.ReplyService;

//將通知設置為已讀，並且跳轉到問題頁面
@Controller
public class NotificationController {

	@Autowired
	private NotificationService notificationService;
	
	@Autowired
	private ReplyService replyService;
	
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
//	  找到回復回復的問題id
      Integer rParentid = replyService.findOne(qParentid).getParentid();
      
      Integer questionid;
      if(type== notificationEnum.NOTIFICATION_QUESTION.getType()){
          questionid=qParentid;
      }else {
          questionid=rParentid;
      }
      return "redirect:/question/"+questionid;
  }
}