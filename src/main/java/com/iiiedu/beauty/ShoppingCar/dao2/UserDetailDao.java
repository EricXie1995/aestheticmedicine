package com.iiiedu.beauty.ShoppingCar.dao2;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.iiiedu.beauty.model.UserDetail;

/**
 * Created by 14437 on 2017/3/1.
 */

public interface UserDetailDao extends JpaRepository<UserDetail, Integer> {
	
//   @Modifying
//   @Query(value = "ALTER TABLE UserDetail DROP FOREIGN KEY FKknfjg7d5xx7k48c7j396vjw5y", nativeQuery = true)
//   void alterUserDetailTableDropForeign1();
   
   
   @Query("delete from UserDetail where userPkId=?1 ")
   public void deleteUserDetailById(int id);
	
//   @Modifying
//   @Query(value = "ALTER TABLE UserDetail add constraint FKknfjg7d5xx7k48c7j396vjw5y foreign key (userPkId) references UserMain (id)",
//   	    nativeQuery = true)
//   void alterUserDetailTableAddForeign1();

	
	@Query("from UserDetail where userPkId=?1 ")
    public UserDetail findUserpkid(int userPkId);
//
//    public void addUserDetail(UserDetail userDetail);
//
//    public boolean deleteUserDetail(int id);
//
//    public boolean updateUserDetail(UserDetail userDetail);
//
//    public List<UserDetail> getAllUserDetail();
}
