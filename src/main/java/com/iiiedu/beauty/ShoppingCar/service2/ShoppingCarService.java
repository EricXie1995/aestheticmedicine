package com.iiiedu.beauty.ShoppingCar.service2;

import java.util.List;
import java.util.Optional;

import com.iiiedu.beauty.model.ShoppingCar;

/**
 * Created by 14437 on 2017/3/3.
 */
public interface ShoppingCarService {
	
    public ShoppingCar getShoppingCar(int userId,int productId);

    public void addShoppingCar(ShoppingCar shoppingCar);

    public void deleteShoppingCar(int userId);

    public void updateShoppingCar(ShoppingCar shoppingCar);

    public List<ShoppingCar> getShoppingCars(int userId);
    
    public ShoppingCar getShoppingCarById(int carId);
}
