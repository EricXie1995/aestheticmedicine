package com.iiiedu.beauty.ShoppingCar.dao2;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
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

	
//	@Modifying
////  @Query(value = "ALTER TABLE Member_SpringBoot DROP FOREIGN KEY FKqvxc704d1s6l58g5owvp3iscq", nativeQuery = true)                                      
//  @Query(value = "ALTER TABLE Member_SpringBoot DROP FOREIGN KEY FKt04ov3fxcp3yqvr4yrsdwo7tp", nativeQuery = true)
//  void alterMemberTableDropForeign1();
//
//	// 執行Native SQL Command以便刪除Member_SpringBoot的外鍵二    
//  @Modifying
//  @Query(value = "ALTER TABLE Member_SpringBoot DROP FOREIGN KEY FKtfal5jlwa6236npyb76pbl1mw",
//  	    nativeQuery = true)
//  void alterMemberTableDropForeign2();
//  
//	// 執行Native SQL Command：truncate table Member_SpringBoot    
//  @Modifying
//  @Query(value = "truncate table Member_SpringBoot",
//  	    nativeQuery = true)
//  void truncateMemberTable();
//  
//	// 執行Native SQL Command：將Member_SpringBoot表格的外鍵一加回    
//  @Modifying
//  @Query(value = "ALTER TABLE Member_SpringBoot add constraint FKt04ov3fxcp3yqvr4yrsdwo7tp foreign key (category_id) references Category (id)",
//  	    nativeQuery = true)
//  void alterMemberTableAddForeign1();
//
//	// 執行Native SQL Command：將Member_SpringBoot表格的外鍵二加回
//  @Modifying
//  @Query(value = "ALTER TABLE Member_SpringBoot add constraint FKtfal5jlwa6236npyb76pbl1mw foreign key (hobby_id) references Hobby (id)",
//  	    nativeQuery = true)
//  void alterMemberTableAddForeign2(); 
	
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
