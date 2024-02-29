package services;

import daos.impl.UserSessionDAO;
import entities.UserSession;

public class UserSessionService {

    private UserSessionDAO userSessionDAO;
    private static UserSessionService instance;

    private UserSessionService() {
        userSessionDAO = UserSessionDAO.getInstance();
    }

    public static UserSessionService getInstance() {
        if (instance == null) {
            instance = new UserSessionService();
        }
        return instance;
    }


    public boolean isValidAdminSessionId(String sessionId) {
        return userSessionDAO.isValidAdminSessionId(sessionId);
    }

    public boolean isValidCustomerSessionId(String sessionId){
        return userSessionDAO.isValidCustomerSessionId(sessionId);
    }

    public boolean saveSessionId(UserSession userSession){
        Integer idRow = userSessionDAO.saveSessionId(userSession);
        return idRow != null && idRow > 0;
    }
}
