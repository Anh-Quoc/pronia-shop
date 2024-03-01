package daos.impl;

import entities.UserSession;
import mappers.impl.UserSessionMapper;
import services.UserService;

import java.sql.*;
import java.util.List;

public class UserSessionDAO extends GenericDao<UserSession> {

    private final String SELECT_SESSION_ID_STATEMENT = "SELECT * FROM user_sessions WHERE session_id = ?";
    private final String INSERT_SESSION_ID_STATEMENT = "INSERT INTO user_sessions (session_id, user_id, time_created, valid_until) VALUES (?, ?, ?, ?)";

    private final String DELETE_SESSION_ID_STATEMENT = "UPDATE user_sessions SET active = 0 WHERE session_id = ?";

    private UserService userService;

    private static UserSessionDAO instance;

    private UserSessionDAO() {
        userService = UserService.getInstance();
    }

    public static UserSessionDAO getInstance() {
        if (instance == null) {
            instance = new UserSessionDAO();
        }
        return instance;
    }

    public boolean isValidAdminSessionId(String sessionId){
        List<UserSession> result = executeQuery(SELECT_SESSION_ID_STATEMENT, new UserSessionMapper(), sessionId);

        if( result == null || result.isEmpty()){
            return false;
        }
        UserSession userSession = result.get(0);

        boolean isValid = isSessionIdActive(userSession);
        isValid = isValid && isSessionIdValidDate(userSession);
        isValid = isValid &&  isAdminRole(userSession);
        return isValid;
    }


    public UserSession getSessionIfValid(String sessionId){
        List<UserSession> result = executeQuery(SELECT_SESSION_ID_STATEMENT, new UserSessionMapper(), sessionId);

        if( result == null || result.isEmpty()){
            return null;
        }
        UserSession userSession = result.get(0);

        boolean isValid = isSessionIdActive(userSession);
        isValid = isValid && isSessionIdValidDate(userSession);
        isValid = isValid && isCustomerRole(userSession);
        if(isValid){
            return userSession;
        }
        return null;
    }

    private boolean isCustomerRole(UserSession userSession){
        return userService.getRoleOfUserById(userSession.getUserId()).equals("Customer");
    }

    private boolean isAdminRole(UserSession userSession){
        return userService.getRoleOfUserById(userSession.getUserId()).equals("Admin");
    }

    private boolean isSessionIdValidDate(UserSession userSession) {
        boolean isValid = false;
        Timestamp validUntil = userSession.getValidUntil();
        if(validUntil != null){
            if(validUntil.compareTo(new Timestamp(System.currentTimeMillis())) >= 0) {
                isValid = true;
            }
        }
        return isValid;
    }

    private boolean isSessionIdActive(UserSession userSession) {
        return userSession.isActive();
    }

    public Integer saveSessionId(UserSession userSession) {
        return executeUpdate(INSERT_SESSION_ID_STATEMENT,
                userSession.getSessionId(), userSession.getUserId(), userSession.getTimeCreated(),
                userSession.getValidUntil());
    }

    public void deleteSessionId(String sessionId) {
        executeUpdate(DELETE_SESSION_ID_STATEMENT, sessionId);
    }

//    private boolean isSessionIDUnique(String sessionId) {
//        boolean isUnique = true;
//        try (Connection connection = DBContext.getConnection()){
//            PreparedStatement statement = connection.prepareStatement("SELECT * FROM user_sessions WHERE session_id = ?");
//            statement.setString(1, sessionId);
//            ResultSet resultSet = statement.executeQuery();
//            if(resultSet.next()) {
//                isUnique = false;
//            }
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//        return isUnique;
//    }

}
