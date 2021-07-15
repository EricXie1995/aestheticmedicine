package com.iiiedu.beauty.ShoppingCar.dao2;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.iiiedu.beauty.model.ShoppingCar;

/**
 * Created by 14437 on 2017/3/3.
 */
public interface ShoppingCarDao extends JpaRepository<ShoppingCar, Integer> {
	
	@Query("from ShoppingCar where userPkId=?1 and productPkId=?2")
    public ShoppingCar findByUserIdAndProductId(int userPkId,int productPkId);
	
	@Query("from ShoppingCar where userPkId=?1")
	public List<ShoppingCar> findByUserPkId(int userPkId);

//    void addShoppingCar(ShoppingCar shoppingCar);
//
//    boolean deleteShoppingCar(int userId,int productId);
//
//    boolean updateShoppingCar(ShoppingCar shoppingCar);
//
//    List<ShoppingCar> getShoppingCars(int userId);
//
//    boolean deleteShoppingCarByUser(int userId);
//
//    boolean deleteShoppingCarByProduct(int productId);

}
