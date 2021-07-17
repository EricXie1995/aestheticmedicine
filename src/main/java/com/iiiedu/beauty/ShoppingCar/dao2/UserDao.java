package com.iiiedu.beauty.ShoppingCar.dao2;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.iiiedu.beauty.model.UserMain;

/**
 * Created by 14437 on 2017/3/1.
 */
public interface UserDao extends JpaRepository<UserMain, Integer> {

//    public UserMain getUser(int id);

	@Query("from UserMain where email=?1 ")
    public UserMain findByEmail(String nameOrEmail);
	
	@Query("from UserMain where name=?1 ")
    public UserMain findByName(String nameOrEmail);

//    public void addUser(UserMain user);
//
//    public boolean deleteUser(int id);
//
//    public boolean updateUser(UserMain user);
//
//    public List<UserMain> getAllUser();
}
