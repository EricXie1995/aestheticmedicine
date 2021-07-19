package com.iiiedu.beauty.ShoppingCar.service2;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iiiedu.beauty.ShoppingCar.dao2.ShoppingRecordDao;
import com.iiiedu.beauty.model.ShoppingRecord;

/**
 * Created by 14437 on 2017/3/3.
 */
@Service
public class ShoppingRecordServiceImplement implements ShoppingRecordService {
    @Autowired
    private ShoppingRecordDao shoppingRecordDao;
    @Override
    public ShoppingRecord findByUserIdAndProductIdAndTime(int userPkId, int productPkId,String time) {
        return shoppingRecordDao.findByUserIdAndProductIdAndTime(userPkId,productPkId,time);
    }

    @Override
    public void addShoppingRecord(ShoppingRecord shoppingRecord) {
        shoppingRecordDao.save(shoppingRecord);
    }


    @Override
    public void updateShoppingRecord(ShoppingRecord shoppingRecord) {
         shoppingRecordDao.save(shoppingRecord);
    }

    @Override
    public List<ShoppingRecord> getShoppingRecordsByOrderStatus(int orderStatus) {
        return shoppingRecordDao.findByOreder(orderStatus);
    }

    @Override
    public List<ShoppingRecord> getShoppingRecords(int userId) {
        return shoppingRecordDao.findByUserPkId(userId);
    }

    @Override
    public List<ShoppingRecord> getAllShoppingRecords() {
        return shoppingRecordDao.findAll();
    }

    @Override
    public boolean getUserProductRecord(int userPkId,int productPkId) {
    	List<ShoppingRecord> shoppingRecord = shoppingRecordDao.getUserProductRecord(userPkId, productPkId);
    	
        return shoppingRecord.size() > 0;
    }
    
    @Override
    public ShoppingRecord getShoppingRecordById(int recordId) {
    	
    	Optional<ShoppingRecord> optional = shoppingRecordDao.findById(recordId);
    	ShoppingRecord shoppingRecord = null;
		if (optional.isPresent()) {
			shoppingRecord = optional.get();
		} else {
			throw new RuntimeException("shoppingRecord.get(id=" + recordId + ")不存在");
		}
		return shoppingRecord;
    }
    
}
