package daos.impl;

import daos.UserDaoInterface;
import entities.User;
import mappers.impl.UserMapper;

import java.util.List;

public class UserDao extends GenericDao<User> implements UserDaoInterface {
    private static UserDao instance;

    private final String SELECT_ALL_USER_STATEMENT = "SELECT * FROM user_view";

    private final String SELECT_USER_BY_ID = "SELECT * FROM user_view WHERE id = ?";

    private final String SELECT_ACTIVE_USER_BY_EMAIL_AND_PASSWORD = "SELECT * FROM user_view WHERE email_address = ? AND password = ? AND active = 1";

    private final String INSERT_USER_STATEMENT = "INSERT INTO users (first_name, last_name, email_address, password, role_id) VALUES (?, ?, ?, ?, ?)";
    private final String DELETE_USER_ACCOUNT_STATEMENT = "UPDATE users SET active = 0 WHERE id = ?";

    private UserDao() {
    }

    public static UserDao getInstance() {
        if (instance == null) {
            instance = new UserDao();
        }
        return instance;
    }

    @Override
    public List<User> getAllUser() {
        return executeQuery(SELECT_ALL_USER_STATEMENT, new UserMapper());
    }

    public User getUserById(Integer userId){
        List<User> listUser = executeQuery(SELECT_USER_BY_ID, new UserMapper(), userId);
        if( listUser != null && !listUser.isEmpty()){
            return listUser.get(0);
        }
        return null;
    }

    public User getUserByUserNameAndPassword(String userName, String password){
        List<User> listUser = executeQuery(SELECT_ACTIVE_USER_BY_EMAIL_AND_PASSWORD, new UserMapper(), userName, password);
        if(listUser == null || listUser.isEmpty()){
            return null;
        }
        return listUser.get(0);
    }

    public String getRoleOfUserById(Integer userId){
        User user = getUserById(userId);
        if(user == null){
            return "";
        }
        return user.getRole();
    }

    public Integer saveUser(User user) {
       return executeUpdate(INSERT_USER_STATEMENT, user.getFirstName(), user.getLastName(), user.getEmailAddress(), user.getPassword(), user.getRoleId());
    }

    @Override
    public void deleteUser(int id) {
        executeUpdate(DELETE_USER_ACCOUNT_STATEMENT, id);
    }


}
