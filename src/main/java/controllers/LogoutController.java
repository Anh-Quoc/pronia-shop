package controllers;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.UserSessionService;

import java.io.IOException;

@WebServlet(name = "LogoutController", urlPatterns = "/logout")
public class LogoutController extends HttpServlet {

    private UserSessionService userSessionService;

    @Override
    public void init() throws ServletException {
        userSessionService = UserSessionService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        logout(req, resp);
    }

    public void logout(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        String accountType = req.getParameter("accountType");

        switch (accountType) {
            case "admin":
                logoutAdmin(req, resp);
                break;
            case "customer":
                logoutCustomer(req, resp);
                break;
        }
        resp.sendRedirect("login");
    }

    private void logoutAdmin(HttpServletRequest req, HttpServletResponse resp) {
        Cookie[] cookies = req.getCookies();
        if(cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("admin_session_id")) {
                    userSessionService.deactivateSessionId(cookie.getValue());
                    Cookie newCookie = new Cookie("admin_session_id", "");
                    newCookie.setMaxAge(0);
                    cookie.setDomain("localhost");
                    cookie.setPath("/pronia-shop");
                    resp.addCookie(newCookie);
                }
            }
        }
    }

    private void logoutCustomer(HttpServletRequest req, HttpServletResponse resp) {
        Cookie[] cookies = req.getCookies();
        if(cookies != null) {
            for (Cookie cookie : cookies) {
                if(cookie.getName().equals("customer_session_id")) {
                    userSessionService.deactivateSessionId(cookie.getValue());
                    Cookie newCookie = new Cookie("customer_session_id", "");
                    newCookie.setMaxAge(0);
                    cookie.setDomain("localhost");
                    cookie.setPath("/pronia-shop");
                    resp.addCookie(newCookie);
                }
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        logout(req, resp);
    }
}
