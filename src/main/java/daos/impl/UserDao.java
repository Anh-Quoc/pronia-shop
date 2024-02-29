package daos.impl;

import daos.UserDaoInterface;
import entities.User;
import mappers.impl.UserMapper;

import java.util.List;

public class UserDao extends GenericDao<User> implements UserDaoInterface {
    private static UserDao instance;

    private final String SELECT_ALL_USER_STATEMENT = "SELECT * FROM user_view";

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
}
