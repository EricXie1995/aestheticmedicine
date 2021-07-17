package com.iiiedu.beauty.forum.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.iiiedu.beauty.model.Favorites;
import com.iiiedu.beauty.model.Member;
import com.iiiedu.beauty.model.Question;

public interface FavoritesService {

	Favorites save(Favorites favorites);
	
	Favorites findByMemberAndQuestion(Member member, Question question);
	
	Integer findFavCountToQue(Integer queId);
	
	Integer DelmemIdAndQueId(Integer memId, Integer queId);
	
	Page<Favorites> findByMember(Member member, Pageable pageable);
}
