package com.iiiedu.beauty.ShoppingCar.service2;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iiiedu.beauty.ShoppingCar.dao2.ShoppingCarDao;
import com.iiiedu.beauty.model.ShoppingCar;

/**
 * Created by 14437 on 2017/3/3.
 */
@Service
public class ShoppingCarServiceImplement implements ShoppingCarService {
    @Autowired
    private ShoppingCarDao shoppingCarDao;
    @Override
    public ShoppingCar getShoppingCar(int userId,int productId) {
        return shoppingCarDao.findByUserIdAndProductId(userId,productId);
    }

    @Override
    public void addShoppingCar(ShoppingCar shoppingCar) {
        shoppingCarDao.save(shoppingCar);
    }

    @Override
    public void deleteShoppingCar(int userId) {
         shoppingCarDao.deleteById(userId);
    }

    @Override
    public void updateShoppingCar(ShoppingCar shoppingCar) {
         shoppingCarDao.save(shoppingCar);
    }

    @Override
    public List<ShoppingCar> getShoppingCars(int userId) {
    	
//    	Optional<ShoppingCar> optional = shoppingCarDao.findById(userId);
//    	ShoppingCar shoppingCar = null;
//		if (optional.isPresent()) {
//			shoppingCar = optional.get();
//		} else {
//			throw new RuntimeException("Member(id=" + userId + ")不存在");
//		}
		return shoppingCarDao.findByUserPkId(userId);
    	
    }
    
    @Override
    public ShoppingCar getShoppingCarById(int carId) {
    	
    	Optional<ShoppingCar> optional = shoppingCarDao.findById(carId);
    	ShoppingCar shoppingCar = null;
		if (optional.isPresent()) {
			shoppingCar = optional.get();
		} else {
			throw new RuntimeException("carId(id=" + carId + ")不存在");
		}
    	
         return shoppingCar;
    }
    
}
