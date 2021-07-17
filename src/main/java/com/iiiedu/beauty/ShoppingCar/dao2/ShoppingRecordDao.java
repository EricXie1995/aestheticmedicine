package com.iiiedu.beauty.ShoppingCar.dao2;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.iiiedu.beauty.model.ShoppingRecord;

/**
 * Created by 14437 on 2017/3/3.
 */
public interface ShoppingRecordDao extends JpaRepository<ShoppingRecord, Integer> {
	
	@Query("from ShoppingRecord where userPkId=?1 and productPkId=?2 and time=?3")
    ShoppingRecord findByUserIdAndProductIdAndTime(int userPkId, int productPkId, String time);
	
	@Query("from ShoppingRecord where userPkId=?1 ")
	List<ShoppingRecord> findByUserPkId(int userpkid);
	
	@Query("from ShoppingRecord where orderStatus=?1 ")
	List<ShoppingRecord> findByOreder(int orderStatus);
	
	@Query("from ShoppingRecord where userPkId=?1 and productPkId=?2 ")
	List<ShoppingRecord> getUserProductRecord(int userPkId, int productPkId );
//    void addShoppingRecord(ShoppingRecord shoppingRecord);
//
//    boolean deleteShoppingRecord(int userId,int productId);
//
//    boolean updateShoppingRecord(ShoppingRecord shoppingRecord);
//
//    List<ShoppingRecord> getShoppingRecords(int userId);
//
//    List<ShoppingRecord> getAllShoppingRecords();
//
//    List<ShoppingRecord> getShoppingRecordsByOrderStatus(int orderStatus);
//
//    boolean getUserProductRecord(int userId,int productId);

//    boolean deleteShoppingRecordByUser(int userId);
//
//    boolean deleteShoppingRecordByProductId(int productId);
}
