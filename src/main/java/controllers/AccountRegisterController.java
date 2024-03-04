package controllers;

import entities.User;
import entities.UserSession;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.CartService;
import services.UserService;
import services.UserSessionService;

import java.io.IOException;

@WebServlet(name = "AccountRegisterController", urlPatterns = "/register")
public class AccountRegisterController extends HttpServlet {

    private UserService userService;
    private CartService cartService;
    private UserSessionService userSessionService;
    private final Integer COOKIE_LIFE_TIME = 60 * 60 * 24;

    @Override
    public void init() throws ServletException {
        userService = UserService.getInstance();
        cartService = CartService.getInstance();
        userSessionService = UserSessionService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Cookie[] cookies = req.getCookies();
        if(cookies != null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("session_id")){
                    req.getRequestDispatcher("home").forward(req, resp);
                    return;
                }
            }
        }
        req.getRequestDispatcher("login-register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String confirmPassword = req.getParameter("confirmPassword");

        if(password.equals(confirmPassword)){
            // Create new user
            Integer userId = userService.createUserAccount(firstName, lastName, email, password, 2);
            // Create new cart
            cartService.createCart(userId);
            login(req, resp, email, password);
        } else {
            // Show error message
            req.setAttribute("wrongConfirmPassword", "Password and confirm password are not the same");
            req.getRequestDispatcher("login-register.jsp").forward(req, resp);
        }
    }

    protected void login(HttpServletRequest req, HttpServletResponse resp, String username, String password) throws ServletException, IOException {
        User user = userService.getUserByUserNameAndPassword(username, password);
        // Check username and password
        if (user != null) {
            // If correct, create session ID and store it in cookie

            UserSession newSession = new UserSession(user.getId());
            while (!userSessionService.saveSessionId(newSession)) {
                newSession = new UserSession(user.getId());
            }

            if (user.getRole().equals("Customer")) {
                Cookie cookie = new Cookie("customer_session_id", newSession.getSessionId());
                cookie.setMaxAge(COOKIE_LIFE_TIME);
                cookie.setDomain("localhost");
                cookie.setPath("/pronia-shop");
                cookie.setHttpOnly(true);
                resp.addCookie(cookie);
                resp.sendRedirect("home");
            }
        }
    }
}
