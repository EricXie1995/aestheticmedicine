package com.iiiedu.beauty.forum.controller;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.iiiedu.beauty.forum.dao.ReplyRepository;
import com.iiiedu.beauty.forum.dto.ResultDto;
import com.iiiedu.beauty.forum.service.FavoritesService;
import com.iiiedu.beauty.forum.service.QuestionService;
import com.iiiedu.beauty.forum.service.ReplyService;
import com.iiiedu.beauty.forum.service.TypeService;
import com.iiiedu.beauty.model.Favorites;
import com.iiiedu.beauty.model.Member;
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

	@Autowired
	private FavoritesService favoritesService;

	@GetMapping("/question/{id}")
	public String question(@PathVariable Integer id, Model model, HttpSession session) {
		// 查找cookies，觀察是否有token存在
//        Cookie[] cookies = request.getCookies();
//        if (cookies == null) {
//            return "login";
//        }
		// 等書偉提供session
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
		// 增加閱讀數
		questionService.increaseview(id);
		model.addAttribute("question", question);
		// 展示回復數據
		List<Reply> reply = replyService.findByParentid(id);
		model.addAttribute("reply", reply);
		// 相關問題
//        String[] tags=question.getTag().split(",");
//        StringBuilder msg=new StringBuilder();
//        for (String tag:tags){
//            msg.append(tag);
//            msg.append("|");
//        }
//        String result=msg.substring(0,msg.length()-1);
//        List<Question> relativequestion =questionService.findAllLikeSearch2(result, id);
//        model.addAttribute("relativequestion",relativequestion);
		
		//相關問題-----------------------------------------
		List<Question> relativequestion = new ArrayList<>(); 
		String[] tags = question.getTag().split(",");
		for (int i = 0; i < tags.length; i++) {
			relativequestion.addAll(questionService.findAllLikeSearch2(tags[i], id));
		}
		//去掉List重複資料，因為若這篇問題多個標籤剛好跟另一筆重複到多個，就會重複
		LinkedHashSet<Question> hashSet = new LinkedHashSet<>(relativequestion);
		List<Question> relativequestion2 = new ArrayList<>(hashSet);
		model.addAttribute("relativequestion",relativequestion2);
		//相關問題-----------------------------------------
		
		// 找到登錄者
		Member member = (Member) session.getAttribute("member");
		// 查詢登錄者id、文章id 是否存在在收藏資料表，這兩個一定是綁在一起的唯一值
		Favorites favorites = favoritesService.findByMemberAndQuestion(member, question);
		//傳去給前端判斷favorites為空顯示收藏，不為空顯示取消
		model.addAttribute("favo", favorites);

		return "forum/question";
	}

	@GetMapping("/question/delete/{queid}")
	public String questionType(@PathVariable Integer queid, RedirectAttributes attributes) {
		questionService.deleteByQuestionPkId(queid);
		attributes.addFlashAttribute("message", "問題刪除成功");
		return "redirect:/personal/questions";
	}
	
	//想做草稿，有問題還沒做
//	@ResponseBody
//	@RequestMapping(value = "/testa", method = RequestMethod.POST)
//	public Object postFavorites(@RequestBody Question question, HttpSession session, Model model) {
//			System.out.println(question.getTitle()+"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
//			System.out.println(question.getType().getTypePkId()+"bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb");
//			System.out.println(question.getDescription()+"cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc");
//			ResultDto<?> resultDto = new ResultDto<Object>();
//			return resultDto.success();
//		}
}
