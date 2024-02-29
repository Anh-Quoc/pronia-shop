package controllers;


import entities.User;
import entities.UserSession;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.UserService;
import services.UserSessionService;

import java.io.IOException;

@WebServlet(name = "LoginController", value = "/login")
public class LoginController extends HttpServlet {

    private final Integer COOKIE_LIFE_TIME = 60 * 60 * 24;

    private UserSessionService userSessionService;
    private UserService userService;

    @Override
    public void init() throws ServletException {
        userSessionService = UserSessionService.getInstance();
        userService = UserService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Cookie[] cookies = req.getCookies();
        if(cookies != null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("session_id")){
                    if(userSessionService.isValidAdminSessionId(cookie.getValue())){
                        req.getRequestDispatcher("admin-dashboard").forward(req, resp);
                    }
                    if(userSessionService.isValidCustomerSessionId(cookie.getValue())){
                        req.getRequestDispatcher("home").forward(req, resp);
                    }
                }
            }
        }
        req.getRequestDispatcher("login-register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        User user = userService.getUserByUserNameAndPassword(username, password);
        // Check username and password
        if (user != null) {
            // If correct, create session ID and store it in cookie

            UserSession newSession = new UserSession(user.getId());
            while (!userSessionService.saveSessionId(newSession)){
                newSession = new UserSession(user.getId());
            }

            Cookie cookie = new Cookie("session_id", newSession.getSessionId());
            cookie.setMaxAge(COOKIE_LIFE_TIME);
            cookie.setDomain("localhost");
            cookie.setPath("/pronia-shop");
            cookie.setHttpOnly(true);
            resp.addCookie(cookie);

            if (user.getRole().equals("Admin")) {
                resp.sendRedirect("admin-dashboard");
            } else if(user.getRole().equals("Customer")){
                resp.sendRedirect("home");
            }

        } else {
            req.setAttribute("error_message", "Username or password is incorrect");
//        resp.sendRedirect("login");
            req.getRequestDispatcher("Login.jsp").forward(req, resp);
        }

    }
}