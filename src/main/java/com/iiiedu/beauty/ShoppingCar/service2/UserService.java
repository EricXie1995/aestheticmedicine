package com.iiiedu.beauty.ShoppingCar.service2;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.Query;

import com.iiiedu.beauty.model.UserMain;

/**
 * Created by 14437 on 2017/3/1.
 */
public interface UserService {
    UserMain getUser(int id);

    public UserMain findByEmailOrName(String nameOrEmail);
	
    void addUser(UserMain user);

    //推荐写法
    void deleteUser(int id);

    void updateUser(UserMain user);

    List<UserMain> getAllUser();
}
