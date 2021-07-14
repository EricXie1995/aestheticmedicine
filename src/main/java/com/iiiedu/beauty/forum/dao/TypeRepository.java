package com.iiiedu.beauty.forum.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.iiiedu.beauty.model.Question;
import com.iiiedu.beauty.model.Type;

public interface TypeRepository extends JpaRepository<Type, Integer> {

	// 透過分類id刪除
	Integer deleteByTypePkId(Integer queId);

	// 透過分類名稱模糊查詢
	@Query(value = "select * from type where typeName like %?1%", nativeQuery = true)
	List<Type> findTypeLikeSearch(String likeString);
}
