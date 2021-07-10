package com.iiiedu.beauty.forum.service.impl;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.iiiedu.beauty.forum.dao.FavoritesRepository;
import com.iiiedu.beauty.forum.service.FavoritesService;
import com.iiiedu.beauty.model.Favorites;
import com.iiiedu.beauty.model.Member;
import com.iiiedu.beauty.model.Question;

@Service
@Transactional
public class FavoritesServiceImpl implements FavoritesService{

	@Autowired
	private FavoritesRepository favoritesRepository;
	
	@Override
	public Favorites save(Favorites favorites) {
		return favoritesRepository.save(favorites);
	}

	@Override
	public Favorites findByMemberAndQuestion(Member member, Question question) {
		return favoritesRepository.findByMemberAndQuestion(member, question);
	}

	@Override
	public Integer findFavCountToQue(Integer queId) {
		return favoritesRepository.findFavCountToQue(queId);
	}

	@Override
	public Integer DelmemIdAndQueId(Integer memId, Integer queId) {
		return favoritesRepository.DelmemIdAndQueId(memId, queId);
	}

	@Override
	public Page<Favorites> findByMember(Member member, Pageable pageable) {
		return favoritesRepository.findByMember(member, pageable);
	}

}
