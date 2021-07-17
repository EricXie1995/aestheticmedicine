package com.iiiedu.beauty.forum.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iiiedu.beauty.forum.dao.QuestionRepository;
import com.iiiedu.beauty.forum.dto.ResultDto;
import com.iiiedu.beauty.forum.service.FavoritesService;
import com.iiiedu.beauty.forum.service.QuestionService;
import com.iiiedu.beauty.model.Favorites;
import com.iiiedu.beauty.model.Member;
import com.iiiedu.beauty.model.Question;

@Controller
public class FavoritesController {
	
	@Autowired
	private FavoritesService favoritesService;
	
	@Autowired
	private QuestionService questionService;
	
	@ResponseBody
	@RequestMapping(value = "/favorites", method = RequestMethod.POST)
	public Object postFavorites(@RequestBody Question question, HttpSession session, Model model) {
		//找到登錄者
		Member member = (Member) session.getAttribute("member");
		//找到文章
		Question question2 = questionService.findOne(question.getQuestionPkId());
		//查詢登錄者id、文章id 是否存在在收藏資料表，這兩個一定是綁在一起的唯一值
		Favorites favorites = favoritesService.findByMemberAndQuestion(member, question2);
		//若收藏資料表不存在兩者則增加，存在刪除(因為點擊一次收藏，再點一次取消收藏)
		if(favorites == null) {
			Favorites favorites2 = new Favorites();
			favorites2.setMember(member);
			favorites2.setQuestion(question2);
			favorites2.setCreatetime(question2.getCreatetime());
			favoritesService.save(favorites2);
		} else {
			favoritesService.DelmemIdAndQueId(member.getMemberPkId(), question.getQuestionPkId());
		}
		//計算收藏資料表某id的文章數量得知收藏數
		Integer favoriteCount = favoritesService.findFavCountToQue(question.getQuestionPkId());
		System.out.println(favoriteCount+"ssssssssssssssssssssssssssssssssssssssssssssssss");
		//將收藏數更新進對應的文章id的收藏數欄位
		questionService.updateFavCount(favoriteCount, question.getQuestionPkId());
		
		//因為點擊收藏時會讓瀏覽數增加，所以這邊瀏覽數減1
		if(question2.getviewcount() != 0 || question2.getviewcount() != null) {
			questionService.updateCutView(question.getQuestionPkId());
		}
		
			ResultDto<?> resultDto = new ResultDto<Object>();
			return resultDto.success();
		}
}
