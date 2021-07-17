package com.iiiedu.beauty.ShoppingCar.service2;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iiiedu.beauty.ShoppingCar.dao2.UserDetailDao;
import com.iiiedu.beauty.model.UserDetail;

/**
 * Created by 14437 on 2017/3/1.
 */
@Service
public class UserDetailServiceImplement implements UserDetailService{

    @Autowired
    private UserDetailDao userDetailDao;

    @Override
    public UserDetail getUserDetail(int userPkId) {
    	
//    	Optional<UserDetail> optional = userDetailDao.findUserpkid(userPkId);
//    	UserDetail userDetail = null;
//		if (optional.isPresent()) {
//			userDetail = optional.get();
//		} else {
//			throw new RuntimeException("userDetail.get(id=" + userPkId + ")不存在");
//		}
		return userDetailDao.findUserpkid(userPkId);
    }

    @Override
    public void addUserDetail(UserDetail userDetail) {
        userDetailDao.save(userDetail);
    }

    @Override
    public void deleteUserDetail(int id) {
         userDetailDao.deleteById(id);
    }

    @Override
    public void updateUserDetail(UserDetail userDetail) {
         userDetailDao.save(userDetail);
    }

    @Override
    public List<UserDetail> getAllUserDetail() {
        return userDetailDao.findAll();
    }
}
