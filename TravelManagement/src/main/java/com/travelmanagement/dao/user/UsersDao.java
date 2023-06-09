package com.travelmanagement.dao.user;

import com.travelmanagement.model.user.UsersModel;

import java.util.List;
//Dao interface defines an abstract API that performs CRUD operations on objects of UserDao
public interface UsersDao {
    public void addUser(UsersModel user);
    public UsersModel getUser(String username);
    public List<UsersModel> getAllUsers();
    public void updateUser(UsersModel user);
    public void deleteUser(int id);
    public UsersModel getUserById(int id);
}
