package jpa.service;

import model.User;

import java.util.UUID;

public interface UserInterface {
    User getUser(UUID userID);
    void addUser(User user);
    User validate(String email, String password);
    void updateUser(String email);
    void deleteUser(String email);
    String getUsersFirstName(String email);
}
