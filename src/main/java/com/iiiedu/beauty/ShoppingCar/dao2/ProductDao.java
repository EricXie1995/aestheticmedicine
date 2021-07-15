package com.iiiedu.beauty.ShoppingCar.dao2;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.iiiedu.beauty.model.Product;

/**
 * Created by 14437 on 2017/3/1.
 */
public interface ProductDao extends JpaRepository<Product, Integer> {
    
//	public Product getProduct(int id);
	
	@Query("from Product where name = :name")
    public Product findByName(@Param("name") String name);
//
//    public void addProduct(Product product);
//
//    public boolean deleteProduct(int id);
//
//    public boolean updateProduct(Product product);
	@Query(value ="select * from Product where keyWord like %?1%",nativeQuery = true)
    public List<Product> findBykwyWordLike(String searchKeyWord);

//    public List<Product> getProductsByType(int type);
//
//    public List<Product> getAllProduct();
}
