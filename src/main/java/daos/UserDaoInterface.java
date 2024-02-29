package daos;

import entities.User;

import java.util.List;

public interface UserDaoInterface {

    List<User> getAllUser();

    void deleteUser(int id);
}
