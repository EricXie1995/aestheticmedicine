package com.iiiedu.beauty.ShoppingCar.service2;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.query.Param;

import com.iiiedu.beauty.model.Product;

/**
 * Created by 14437 on 2017/3/2.
 */
public interface ProductService {
    public Product getProduct(int id);

    public Product getProduct(String name);

    public void addProduct(Product product);

    void deleteProduct(int id);

    public void updateProduct(Product product);

//    public List<Product> getProductsByKeyWord(String searchKeyWord);
    public List<Product> getProductsByKeyWord(String searchKeyWord);

    public Optional<Product> getProductsByType(int type);

    public List<Product> getAllProduct();
}
