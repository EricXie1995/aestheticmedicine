package com.iiiedu.beauty.ShoppingCar.service2;

import java.util.List;
import java.util.Optional;

import com.iiiedu.beauty.model.ShoppingRecord;

/**
 * Created by 14437 on 2017/3/3.
 */
public interface ShoppingRecordService {
    public ShoppingRecord findByUserIdAndProductIdAndTime(int userPkId, int productPkId, String time);

    public void addShoppingRecord(ShoppingRecord shoppingRecord);

    public void deleteShoppingRecord(int userId);

    public void updateShoppingRecord(ShoppingRecord shoppingRecord);

    public List<ShoppingRecord> getShoppingRecordsByOrderStatus(int orderStatus);

    public List<ShoppingRecord> getShoppingRecords(int userId);

    public List<ShoppingRecord> getAllShoppingRecords();

    public boolean getUserProductRecord(int userId,int productId);
    
    public ShoppingRecord getShoppingRecordById(int recordId);
}
