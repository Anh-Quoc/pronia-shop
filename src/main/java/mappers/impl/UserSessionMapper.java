package mappers.impl;

import entities.UserSession;
import mappers.RowMapperInterface;

import java.sql.ResultSet;

public class UserSessionMapper implements RowMapperInterface<UserSession> {

    @Override
    public UserSession mapRow(ResultSet rs) {

        try {
            UserSession userSession = new UserSession();
            userSession.setId(rs.getInt("id"));
            userSession.setSessionId(rs.getString("session_id"));
            userSession.setUserId(rs.getInt("user_id"));
            userSession.setTimeCreated(rs.getTimestamp("time_created"));
            userSession.setValidUntil(rs.getTimestamp("valid_until"));
            userSession.setActive(rs.getBoolean("active"));
            return userSession;
        } catch (Exception e) {
            return null;
        }

    }
}
