package jpa.service;

import model.Products;

import java.util.List;

public interface ProductsInterface {
    List<Products> findAllProducts();
    int findProductPriceByName(String product);
    int findNumberOfProductByName(String product);
    int updateNumberOfProductByName(Integer value, String product);
}
