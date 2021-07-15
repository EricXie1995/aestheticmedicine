package com.iiiedu.beauty.ShoppingCar.service2;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iiiedu.beauty.ShoppingCar.dao2.EvaluationDao;
import com.iiiedu.beauty.ShoppingCar.dao2.ShoppingCarDao;
import com.iiiedu.beauty.ShoppingCar.dao2.ShoppingRecordDao;
import com.iiiedu.beauty.ShoppingCar.dao2.UserDao;
import com.iiiedu.beauty.ShoppingCar.dao2.UserDetailDao;
import com.iiiedu.beauty.model.UserMain;

/**
 * Created by 14437 on 2017/3/1.
 */
@Service
public class UserServiceImplement implements UserService {

    @Autowired
    private UserDao userDao;
    @Autowired
    private UserDetailDao userDetailDao;
    @Autowired
    private ShoppingRecordDao shoppingRecordDao;
    @Autowired
    private ShoppingCarDao shoppingCarDao;
    @Autowired
    private EvaluationDao evaluationDao;

    @Override
    public UserMain getUser(int id) {
    	
    	Optional<UserMain> optional = userDao.findById(id);
    	UserMain userMain = null;
		if (optional.isPresent()) {
			userMain = optional.get();
		} else {
			throw new RuntimeException("userService(id=" + id + ")不存在");
		}
		return userMain;
    }

    @Override
    public UserMain findByEmailOrName(String nameOrEmail) {
    	UserMain user = new UserMain();
    	user = userDao.findByEmail(nameOrEmail);
    	if(user == null) {
    		user = userDao.findByName(nameOrEmail);
    	}
    	return user;
    }
    
    

    @Override
    public void addUser(UserMain user) {
        userDao.save(user);
    }

    //推荐写法，具体业务逻辑放在Service实现方法里面
    @Override
    @Transactional
    public void deleteUser(int id) {
        //判断此用户是否存在购买记录、评价记录、购物车记录，如果存在，则应该先删除对应的记录，否则后续删除会出错
//        try {
//            evaluationDao.deleteEvaluationByUser(id);
//            shoppingCarDao.deleteShoppingCarByUser(id);
//            shoppingRecordDao.deleteShoppingRecordByUser(id);
//            userDetailDao.deleteUserDetail(id);
//            userDao.deleteUser(id);
//            return new Response(1, "删除成功", null);
//        }catch (Exception e) {
//            return new Response(0, "删除失败", null);
//        }
    	userDao.deleteById(id);
    }

    @Override
    public void updateUser(UserMain user) {
         userDao.save(user);
    }

    @Override
    public List<UserMain> getAllUser() {
        return userDao.findAll();
    }
}
