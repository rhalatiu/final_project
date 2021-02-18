package jpa.service;


import jpa.listener.LocalEntityManagerFactory;
import model.User;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;
import java.util.UUID;


public class DBUser implements UserInterface {
    static final Logger LOGGER = LogManager.getLogger(DBUser.class);
    private final EntityManager entityManager;
    public DBUser(){
        entityManager = LocalEntityManagerFactory.createEntityManager();
    }

    @Override
    public User getUser(UUID userID) {
        return null;
    }

    @Override
    public void addUser(User user) {
        entityManager.getTransaction().begin();
        entityManager.persist(user);
        entityManager.flush();
        entityManager.getTransaction().commit();

    }

    @Override
    public void updateUser(String email) {
        entityManager.getTransaction().begin();
        EntityTransaction et = null;
        User user = null;
        try {
            user = entityManager.find(User.class, email);
            user.setEmail(email);
            entityManager.refresh(user);
            entityManager.persist(user);
            et.commit();
        }catch (Exception ex){
            if(et != null){
                et.rollback();
            }
            ex.printStackTrace();
        }
    }

    @Override
    public void deleteUser(String email) {
        entityManager.getTransaction().begin();
        EntityTransaction et = null;
        User user = null;
        try {
            user = entityManager.find(User.class, email);
            entityManager.refresh(user);
            entityManager.persist(user);
            et.commit();
        }catch (Exception ex){
            if(et != null){
                et.rollback();
            }
            ex.printStackTrace();
        }
    }

    @Override
    public User validate(String email, String password) {
        entityManager.getTransaction().begin();
        EntityTransaction et = entityManager.getTransaction();
        String query = "SELECT u FROM User u WHERE u.email = :email AND u.password = :password";
        TypedQuery<User> tq = entityManager.createQuery(query, User.class);
        tq.setParameter("email", email);
        tq.setParameter("password", password);
        User user = null;
        try {
            user = tq.getSingleResult();
            System.out.println(user.getEmail());
            et.commit();
            return user;
        }
        catch (NoResultException ex){
            ex.printStackTrace();
            et.rollback();
            return null;
        }
    }

    public String getUsersFirstName(String email){
       return entityManager.createQuery("SELECT a.firstName FROM User a WHERE a.email = :email", String.class).setParameter("email", email).getSingleResult();
    }
}
