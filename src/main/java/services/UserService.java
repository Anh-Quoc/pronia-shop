package services;

import daos.impl.UserDao;
import entities.User;

import java.util.List;

public class UserService {

    private UserDao userDao;
    private static UserService instance;

    private UserService() {
        userDao = UserDao.getInstance();
    }

    public static UserService getInstance() {
        if (instance == null) {
            instance = new UserService();
        }
        return instance;
    }

    public List<User> getAllUser() {
        return userDao.getAllUser();
    }

    public User getUserByUserNameAndPassword(String username, String password){
        return userDao.getUserByUserNameAndPassword(username, password);
    }

    public String getRoleOfUserById(Integer id){
        return userDao.getRoleOfUserById(id);
    }

    public void deleteUserByID(int id) {
        userDao.deleteUser(id);
    }

}
