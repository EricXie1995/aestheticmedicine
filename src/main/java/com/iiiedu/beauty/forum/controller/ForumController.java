package com.iiiedu.beauty.forum.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.iiiedu.beauty.forum.dao.QuestionRepository;
import com.iiiedu.beauty.forum.service.NotificationService;
import com.iiiedu.beauty.forum.service.QuestionService;
import com.iiiedu.beauty.forum.service.ReplyService;
import com.iiiedu.beauty.forum.service.TypeService;
import com.iiiedu.beauty.member.repository.MemberRepository;
import com.iiiedu.beauty.member.security.MemberUserDetails;
import com.iiiedu.beauty.model.Favorites;
import com.iiiedu.beauty.model.Member;
import com.iiiedu.beauty.model.Notification;
import com.iiiedu.beauty.model.Question;
import com.iiiedu.beauty.model.Type;

@Controller
public class ForumController {

	@Autowired
	private QuestionService questionService;

	@Autowired
	private MemberRepository memberRepository;

	@Autowired
	private TypeService typeService;

	@Autowired
	private QuestionRepository questionRepository;
	
	@Autowired
	private NotificationService notificationService;
	
	@Autowired
	private ReplyService replyService;

	@GetMapping("/test2")
	public String test2() {
		return "test2";
	}

	// 論壇首頁
	@GetMapping("/forum/{typId}")
//	@GetMapping(path = {"/forum/{typId}", "/forum"})
	public String forum(@PathVariable Integer typId,
			/*
			 * @PageableDefault/*(size = 5, sort = { "createtime" }, direction =
			 * Sort.Direction.DESC) Pageable pageable,
			 */
			@RequestParam(defaultValue = "0") Integer page, @RequestParam(defaultValue = "createtime") String sort,
			@RequestParam(required = false) String searchQ, @RequestParam(required = false) List<Integer> checkType,
			HttpSession session, Model model, @AuthenticationPrincipal MemberUserDetails user) {

		// 讓論壇首頁抓到分類顯示出來
		List<Type> types = typeService.findAll();
		model.addAttribute("types", types);

		// 記住目前選中的排序傳給前端
		model.addAttribute("sort", sort);

		// 找到登錄者放進session
		Member member = memberRepository.findByMemberAccount(user.getUsername());
		System.out.println(user.getUsername()+"PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP");
		session.setAttribute("member", member);
		
		//未登錄返回登錄頁面
		if (member == null) {
			return "login";
		}
		Page<Question> page1 = null;
//		Page<Question> page2 = null;

		Pageable pageable = PageRequest.of(page, 5, Sort.by(Sort.Direction.DESC, sort));
		System.out.println(searchQ+"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
		System.out.println(checkType+"MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM");
//		System.out.println(checkType.length+"");
		
		//模糊查詢
		if (searchQ != null && searchQ != "") {
			System.out.println(searchQ+"zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
			page1 = questionRepository.findAllLikeSearch(searchQ, pageable);
			model.addAttribute("page", page1);
			model.addAttribute("searchQ", searchQ);
			//模糊查詢帶分類多選條件
			if(checkType!= null && checkType.size()>0) {
				System.out.println(checkType.size()+"進到第二層進到第二層進到第二層進到第二層進到第二層進到第二層進到第二層進到第二層進到第二層進到第二層");
				//這個迴圈是為了讓前端用EL直接用${check}取得get網址列查詢字串
				String check = "";
				for (int i = 0; i < checkType.size(); i++) {
					if (i == checkType.size() - 1) {
						check += checkType.get(i) + "";
					} else {
						check += checkType.get(i) + "&checkType=";
					}
				}
				//這個迴圈是為了讓前端用EL直接用${check2}顯示選中的分類搜尋條件
				String check2 = "";
				Type type;
				for (int i = 0; i < checkType.size(); i++) {
					type = typeService.findOne(checkType.get(i));
					if (i == checkType.size() - 1) {
						check2 += type.getTypeName();
					} else {
						check2 += type.getTypeName() + " / ";
					}
				}
				//呼叫模糊查詢資料庫語句
				if (checkType.size() == 1) {
					System.out.println(checkType.get(0)+"QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ");
					page1 = questionRepository.findLikeSearch(searchQ, checkType.get(0), pageable);
				} else if (checkType.size() == 2) {
					page1 = questionRepository.findLikeSearch(searchQ, checkType.get(0), checkType.get(1), pageable);
				} else if (checkType.size() == 3) {
					page1 = questionRepository.findLikeSearch(searchQ, checkType.get(0), checkType.get(1), checkType.get(2), pageable);
				} else if (checkType.size() == 4) {
					page1 = questionRepository.findLikeSearch(searchQ, checkType.get(0), checkType.get(1), checkType.get(2), checkType.get(3), pageable);
				} else if (checkType.size() == 5) {
					page1 = questionRepository.findLikeSearch(searchQ, checkType.get(0), checkType.get(1), checkType.get(2), checkType.get(3), checkType.get(4), pageable);
				}  else if (checkType.size() == 6) {
					page1 = questionRepository.findLikeSearch(searchQ, checkType.get(0), checkType.get(1), checkType.get(2), checkType.get(3), checkType.get(4), checkType.get(5), pageable);
				}
				model.addAttribute("page", page1);
				model.addAttribute("searchQ", searchQ);
				model.addAttribute("checkType", check);
				model.addAttribute("seleType", check2); 
			}
		} else if (typId == -1) {
			// 顯示全部
			page1 = questionService.findAllByPage(pageable);
			model.addAttribute("page", page1);
			model.addAttribute("typId", typId);
//			//查詢結果總行數
//			System.out.println(page1.getTotalElements());
//			//按照當前分頁大小，總頁數
//			System.out.println(page1.getTotalPages());
		} else {
			// 照分類顯示
			page1 = questionService.findByType(typId, pageable);
			model.addAttribute("page", page1);
			model.addAttribute("typId", typId);
		}
//====================================================================================================
		Pageable pageable2 = PageRequest.of(0, 6, Sort.by(Sort.Direction.DESC, "createtime"));
//		Member member = (Member) session.getAttribute("member");
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
				

            model.addAttribute("section","information");
            model.addAttribute("sectionname","我的消息");
            Page<Notification> page2 = notificationService.findByMemIdToNoti(userId, pageable2);
//            PageDto<NotificationDto> notifications= notificationService.list(user.getId(),page,size);
            model.addAttribute("page2", page2);
        

//====================================================================================================
		

		return "forum/forum";
	}
	
	
}
