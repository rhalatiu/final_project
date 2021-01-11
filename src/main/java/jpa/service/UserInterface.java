package jpa.service;

import model.User;

import java.util.List;
import java.util.UUID;

public interface UserInterface {
    User getUser(UUID userID);
    void addUser(User user);
    boolean validate(String email, String password);
    void updateUser(String email);
    void deleteUser(String email);
}
