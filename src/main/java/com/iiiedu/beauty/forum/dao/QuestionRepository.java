package com.iiiedu.beauty.forum.dao;

import java.util.Date;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.iiiedu.beauty.model.Question;

public interface QuestionRepository extends JpaRepository<Question, Integer> {

	// 個人的所有文章
	@Query(value = "select * from question where memberPkId = ?1", nativeQuery = true)
	Page<Question> findByQuery(Integer memId, Pageable pageable);

	// 依分類搜尋文章，分頁顯示
	@Query(value = "select * from question where typePkId = ?1", nativeQuery = true)
	Page<Question> findByType(Integer typId, Pageable pageable);

	// 瀏覽數
	@Modifying
	@Query(value = "update question set viewcount = isnull(viewcount, 0)+1 where questionpkid = ?1", nativeQuery = true)
	Integer updateView(Integer queId);

	// 回覆數
	@Modifying
	@Query(value = "update question set qcommentcount = isnull(qcommentcount, 0)+1 where questionpkid = ?1", nativeQuery = true)
	Integer updatecomment(Integer parId);

	// 收藏數
	@Modifying
	@Query(value = "update question set favoritecount = ?1 where questionpkid = ?2", nativeQuery = true)
	Integer updateFavCount(Integer favCount, Integer queId);

	// 透過問題id刪除
	Integer deleteByQuestionPkId(Integer queId);

	// 透過標題、內容模糊查詢分頁顯示
	@Query(value = "select * from question where description like %?1% or title like %?1%", nativeQuery = true)
	Page<Question> findAllLikeSearch(String likeString, Pageable pageable);

	@Query(value = "select * from question where (description like %?1% or title like %?1%) and typePkId = ?2", nativeQuery = true)
	Page<Question> findLikeSearch(String likeString, Integer typeId, Pageable pageable);

	@Query(value = "select * from question where (description like %?1% or title like %?1%) and (typePkId = ?2 or typePkId = ?3)", nativeQuery = true)
	Page<Question> findLikeSearch(String likeString, Integer typeId, Integer typeId2, Pageable pageable);

	@Query(value = "select * from question where (description like %?1% or title like %?1%) and (typePkId = ?2 or typePkId = ?3 or typePkId = ?4)", nativeQuery = true)
	Page<Question> findLikeSearch(String likeString, Integer typeId, Integer typeId2, Integer typeId3,
			Pageable pageable);

//	@Query(value = "select * from question where (description like %?1% or title like %?1%) and if(?2 !='',typePkId=?2,1=1) and if(?3 !='',typePkId=?3,1=1) and if(?4 !='',typePkId=?4,1=1)", nativeQuery = true)
//	Page<Question> findLikeSearch(String likeString, Integer typeId, Integer typeId2, Integer typeId3, Pageable pageable);

	// 透過某分類找到對應的文章數量
	@Query(value = "SELECT COUNT(typePkId) FROM question Where typePkId = ?1", nativeQuery = true)
	Integer findQueCountBYTypId(Integer typId);

	@Query(value = "select COUNT(questionPkId) FROM Question　where MONTH(createtime) = ?1", nativeQuery = true)
	Integer findQueCountByMonth(Integer month);

	List<Question> findAllByOrderByCreatetimeDesc();

	// 透過標題、內容模糊查詢
	@Query(value = "select * from question where description like %?1% or title like %?1%", nativeQuery = true)
	List<Question> findAllLikeSearch(String likeString);
	
	// 依日期區間搜尋文章
	@Query(value = "SELECT * FROM Question WHERE createtime >= ?1 AND createtime <= ?2", nativeQuery = true)
	List<Question> findAllByDate(String date1, String date2);

	// 依分類搜尋文章
	@Query(value = "select * from question where typePkId = ?1", nativeQuery = true)
	List<Question> findByType(Integer typId);
	
	// 透過標題、內容關鍵字模糊查詢，以及設定日期區間、分類條件
	@Query(value = "select * from question where (description like %?1% or title like %?1%) AND (createtime >= ?2 AND createtime <= ?3) AND typePkId = ?4", nativeQuery = true)
	List<Question> findByLikeAndDateAndType(String likeString, String date1, String date2, Integer typId);
	
	// 依日期區間、分類查詢
	@Query(value = "select * from question where createtime >= ?1 AND createtime <= ?2 AND typePkId = ?3", nativeQuery = true)
	List<Question> findByDateAndType(String date1, String date2, Integer typId);
}
