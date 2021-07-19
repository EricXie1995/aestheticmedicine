package com.iiiedu.beauty.ShoppingCar.dao2;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.iiiedu.beauty.model.Evaluation;

/**
 * Created by 14437 on 2017/3/7.
 */
public interface EvaluationDao extends JpaRepository<Evaluation, Integer> {
	
	@Query("from Evaluation where userPkId=?1 and productPkId=?2 and time=?3")
    public Evaluation findByUserIdAndProductIdAndTime(int userPkId,int productPkId,String time);

	@Query("from Evaluation where userPkId=?1")
	public List<Evaluation> findByUserPkId(int userPkId);
//    public void addEvaluation(Evaluation evaluation);
//
//    public boolean deleteEvaluation(int userId,int productId,String time);
//
//    public boolean updateEvaluation(Evaluation evaluation);
//
	@Query("from Evaluation where productPkId=?1 ")
    public List<Evaluation> findEvaluationsByProductPkId(int productPkId);
//
//    boolean deleteEvaluationByUser(int userId);
//
//    boolean deleteEvaluationByProduct(int productId);
}
