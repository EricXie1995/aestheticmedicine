package com.iiiedu.beauty.ShoppingCar.service2;

import java.util.List;
import java.util.Optional;

import com.iiiedu.beauty.model.UserDetail;
import com.iiiedu.beauty.model.UserMain;

/**
 * Created by 14437 on 2017/3/1.
 */
public interface UserDetailService {
	
    public UserDetail getUserDetail(int userPkId);

    public void addUserDetail(UserDetail userDetail);

    public void deleteUserDetail(int id);

    public void updateUserDetail(UserDetail userDetail);

    public List<UserDetail> getAllUserDetail();
}
