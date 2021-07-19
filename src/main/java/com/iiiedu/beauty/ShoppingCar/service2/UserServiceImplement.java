package com.iiiedu.beauty.ShoppingCar.service2;

import java.util.List;
import java.util.Optional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iiiedu.beauty.ShoppingCar.dao2.EvaluationDao;
import com.iiiedu.beauty.ShoppingCar.dao2.ProductDao;
import com.iiiedu.beauty.ShoppingCar.dao2.ShoppingCarDao;
import com.iiiedu.beauty.ShoppingCar.dao2.ShoppingRecordDao;
import com.iiiedu.beauty.ShoppingCar.dao2.UserDao;
import com.iiiedu.beauty.ShoppingCar.dao2.UserDetailDao;
import com.iiiedu.beauty.model.ShoppingCar;
import com.iiiedu.beauty.model.ShoppingRecord;
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
    @PersistenceContext
    private EntityManager entityManager;
    @Autowired
    private ProductDao productDao;
    
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
//    @Transactional
    public void deleteUser(int userPkId) {
        //判断此用户是否存在购买记录、评价记录、购物车记录，如果存在，则应该先删除对应的记录，否则后续删除会出错
        try {
        	System.out.println("userPkId = "+userPkId);
        	
//        	List<Evaluation> evaluationlist = evaluationDao.findByUserPkId(userPkId);
//            for (Evaluation evaluation : evaluationlist) {
//            	evaluationDao.deleteById(evaluation.getEvaId());
//			}
//            System.out.println("evaluationlist成功");
        	
//            List<ShoppingCar> shoppingCarlist = shoppingCarDao.findByUserPkId(userPkId);
//            for (ShoppingCar shoppingCar : shoppingCarlist) {
//            	int shoppingCarID = shoppingCar.getCarId();
//            	
//            	entityManager.detach(shoppingCar.getProduct());
//            	entityManager.detach(userDetailDao);
//            	entityManager.detach(shoppingCar.getUserMain());
//            	System.out.println("shoppingCarID = "+ shoppingCarID);
//            	shoppingCarDao.delete(shoppingCar);
//			}
//            System.out.println("shoppingCarlist成功");
            
//            List<ShoppingRecord> shoppingRecordlist = shoppingRecordDao.findByUserPkId(userPkId);
//            for (ShoppingRecord shoppingRecord : shoppingRecordlist) {
//            	int shoppingRecordID = shoppingRecord.getRecordId();
//            	System.out.println("shoppingCarID = "+ shoppingRecordID);
//            	
//            	entityManager.detach(shoppingRecord.getProduct());
//            	shoppingRecordDao.deleteById(shoppingRecordID);
//            }
//            System.out.println("shoppingRecordlist成功");
        	
        	int userDetailid = userDetailDao.findUserpkid(userPkId).getId();
            System.out.println("userDetailid = "+userDetailid);
            userDetailDao.deleteById(userDetailid);;
            System.out.println("userDetail成功");
//        	entityManager.detach(shoppingCarlist);
//        	entityManager.detach(shoppingRecordlist);
//        	entityManager.detach(userDetailDao.findUserpkid(userPkId));
            userDao.deleteById(userPkId);
            System.out.println("删除成功");
//            return new Response(1, "删除成功", null);
        }catch (Exception e) {
        	System.out.println("删除失败");
//            return new Response(0, "删除失败", null);
        }
//    	userDao.deleteById(userPkId);
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
