package com.iiiedu.beauty.ShoppingCar.service2;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iiiedu.beauty.ShoppingCar.dao2.EvaluationDao;
import com.iiiedu.beauty.model.Evaluation;

/**
 * Created by 14437 on 2017/3/7.
 */
@Service
public class EvaluationServiceImplement implements EvaluationService {
    @Autowired
    private EvaluationDao evaluationDao;

    @Override
    public Evaluation findByUserIdAndProductIdAndTime(int userId, int productId, String time) {
        return evaluationDao.findByUserIdAndProductIdAndTime(userId,productId,time);
    }

    @Override
    public void addEvaluation(Evaluation evaluation) {
        evaluationDao.save(evaluation);
    }

    @Override
    public void deleteEvaluation(int evaId) {
        evaluationDao.deleteById(evaId);
    }

    @Override
    public void updateEvaluation(Evaluation evaluation) {
        evaluationDao.save(evaluation);
    }

    @Override
    public List<Evaluation> getProductEvaluations(int productPkId) {
        return evaluationDao.findEvaluationsByProductPkId(productPkId);
    }
    
    @Override
    public Evaluation findByEvaId(int evaId) {
    	Optional<Evaluation> optional = evaluationDao.findById(evaId);
    	Evaluation evaluation = null;
		if (optional.isPresent()) {
			evaluation = optional.get();
		} else {
			throw new RuntimeException("evaluation.get(id=" + evaId + ")不存在");
		}
		return evaluation;
    }
}
