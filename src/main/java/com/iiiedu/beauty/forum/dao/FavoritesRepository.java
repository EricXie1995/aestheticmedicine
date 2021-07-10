package com.iiiedu.beauty.forum.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.iiiedu.beauty.model.Favorites;
import com.iiiedu.beauty.model.Member;
import com.iiiedu.beauty.model.Notification;
import com.iiiedu.beauty.model.Question;

public interface FavoritesRepository extends JpaRepository<Favorites, Integer>{

	Favorites findByMemberAndQuestion(Member member, Question question);
	
	//找到某文章被收藏數量
	@Query(value = "SELECT COUNT(questionPkId) FROM Favorites Where questionPkId = ?1")
	Integer findFavCountToQue(Integer queId);
	
	//取消收藏
	@Modifying
	@Query(value = "DELETE FROM Favorites WHERE memberPkId=?1 AND questionPkId=?2", nativeQuery = true)
	Integer DelmemIdAndQueId(Integer memId, Integer queId);
	
	//找到目前登錄者收藏的文章
	Page<Favorites> findByMember(Member member, Pageable pageable);
}
