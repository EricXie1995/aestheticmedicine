package com.iiiedu.beauty.ShoppingCar.dao2;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.iiiedu.beauty.model.UserDetail;

/**
 * Created by 14437 on 2017/3/1.
 */
public interface UserDetailDao extends JpaRepository<UserDetail, Integer> {

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
