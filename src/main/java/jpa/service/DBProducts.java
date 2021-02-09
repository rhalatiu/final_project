package jpa.service;

import jpa.listener.LocalEntityManagerFactory;
import model.Products;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.persistence.EntityManager;
import java.util.List;

public class DBProducts {
    static final Logger LOGGER = LogManager.getLogger(DBProducts.class);
    private final EntityManager entityManager;
    public DBProducts(){
        entityManager = LocalEntityManagerFactory.createEntityManager();
    }

    public List<Products> findAllProducts(){
        return entityManager.createQuery("SELECT a FROM Products a", Products.class).getResultList();
    }

    public int findProductPriceByName(String product){
        return entityManager.createQuery("SELECT a.productPrice FROM Products a WHERE a.productName = :name", Integer.class).setParameter("name", product).getSingleResult();
    }

    public int findNumberOfProductByName(String product){
        return entityManager.createQuery("SELECT a.quantity FROM Products a WHERE a.productName = :name", Integer.class).setParameter("name", product).getSingleResult();
    }

    public int updateNumberOfProductByName(Integer value, String product){
        entityManager.getTransaction().begin();
        entityManager.createQuery("UPDATE Products a SET a.quantity = :quantity WHERE a.productName = :name").setParameter("name", product).setParameter("quantity", value).executeUpdate();
        entityManager.getTransaction().commit();
        return 1;
    }
}
