package com.iiiedu.beauty.ShoppingCar.service2;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iiiedu.beauty.ShoppingCar.dao2.EvaluationDao;
import com.iiiedu.beauty.ShoppingCar.dao2.ProductDao;
import com.iiiedu.beauty.ShoppingCar.dao2.ShoppingCarDao;
import com.iiiedu.beauty.ShoppingCar.dao2.ShoppingRecordDao;
import com.iiiedu.beauty.model.Product;

/**
 * Created by 14437 on 2017/3/2.
 */

@Service
public class ProductServiceImplement implements ProductService {
    @Autowired
    private ProductDao productDao;
    @Autowired
    private ShoppingRecordDao shoppingRecordDao;
    @Autowired
    private ShoppingCarDao shoppingCarDao;
    @Autowired
    private EvaluationDao evaluationDao;

    @Override
    public Product getProduct(int id) {
    	
    	System.out.println("12312313213");
    	Optional<Product> optional = productDao.findById(id);
		Product product = null;
		if (optional.isPresent()) {
			product = optional.get();
		} else {
			throw new RuntimeException("product.get(id=" + id + ")不存在");
		}
		return product;
    }

    @Override
    public Product getProduct(String name) {
        return productDao.findByName(name);
    }

    @Override
    public void addProduct(Product product) {
        productDao.save(product);
    }

    @Override
    public void deleteProduct(int id) {
//        try {
//            evaluationDao.deleteEvaluationByProduct(id);
//            shoppingCarDao.deleteShoppingCarByProduct(id);
//            shoppingRecordDao.deleteShoppingRecordByProductId(id);
//            productDao.deleteProduct(id);
//            return new Response(1, "删除商品成功", null);
//        }catch (Exception e){
//            return new Response(0,"删除商品失败",null);
//        }
    	productDao.deleteById(id);
    }

    @Override
    public void updateProduct(Product product) {
        productDao.save(product);
    }

    @Override
    public List<Product> getProductsByKeyWord(String searchKeyWord) {
        return productDao.findBykwyWordLike(searchKeyWord);
    }

    @Override
    public Optional<Product> getProductsByType(int type) {
        return productDao.findById(type);
    }

    @Override
    public List<Product> getAllProduct() {
        return productDao.findAll();
    }
}
