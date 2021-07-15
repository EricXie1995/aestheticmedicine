package com.iiiedu.beauty.ShoppingCar.service2;

import java.util.List;
import java.util.Optional;

import com.iiiedu.beauty.model.Evaluation;

/**
 * Created by 14437 on 2017/3/7.
 */
public interface EvaluationService {
    
//	public Evaluation getEvaluation(int userId, int productId, String time);

	public Evaluation findByUserIdAndProductIdAndTime(int userPkId, int productPkId, String time);
	
    public void addEvaluation(Evaluation evaluation);

    public void deleteEvaluation(int evaId);

    public void updateEvaluation(Evaluation evaluation);

    public List<Evaluation> getProductEvaluations(int productPkId);
    
    public Evaluation findByEvaId(int evaId);
}
