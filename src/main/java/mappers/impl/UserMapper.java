package mappers.impl;

import entities.User;
import mappers.RowMapperInterface;

import java.sql.ResultSet;

public class UserMapper implements RowMapperInterface<User> {
    @Override
    public User mapRow(ResultSet resultSet) {
        User newUser = new User();
        try {
            newUser.setId(resultSet.getInt("id"));
            newUser.setFirstName(resultSet.getString("first_name"));
            newUser.setLastName(resultSet.getString("last_name"));
            newUser.setEmailAddress(resultSet.getString("email_address"));
            newUser.setPassword(resultSet.getString("password"));
            newUser.setCountry(resultSet.getString("country"));

            newUser.setStreetAddress(resultSet.getString("street_address"));
            newUser.setApartment(resultSet.getString("apartment"));
            newUser.setCity(resultSet.getString("city"));
            newUser.setPhone(resultSet.getString("phone"));
            newUser.setActive(resultSet.getBoolean("active"));
            newUser.setRole(resultSet.getString("role_name"));
        } catch (Exception e) {
            return null;
        }
        return newUser;
    }
}
