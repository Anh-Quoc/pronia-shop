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

    public User getUserById(Integer id) {
        return userDao.getUserById(id);
    }

    public List<User> getAllUser() {
        return userDao.getAllUser();
    }

    public User getUserByUserNameAndPassword(String username, String password){
        return userDao.getUserByUserNameAndPassword(username, password);
    }

    public Integer createUserAccount(String firstName, String lastName, String emailAddress, String password, Integer roleId) {

        User newUser = new User();
        newUser.setFirstName(firstName);
        newUser.setLastName(lastName);
        newUser.setEmailAddress(emailAddress);
        newUser.setPassword(password);

        newUser.setRoleId(roleId);

        return userDao.saveUser(newUser);

    }

    public String getRoleOfUserById(Integer id){
        return userDao.getRoleOfUserById(id);
    }

    public void deleteUserByID(int id) {
        userDao.deleteUser(id);
    }

}
