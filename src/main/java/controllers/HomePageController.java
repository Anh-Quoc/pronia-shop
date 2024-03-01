package controllers;

import entities.UserSession;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.CartService;
import services.PlantService;
import services.UserService;
import services.UserSessionService;

import java.io.IOException;

@WebServlet(name = "HomePageController", urlPatterns = {"/home", "/index"})
public class HomePageController extends HttpServlet {

    private PlantService plantService;
    private UserSessionService userSessionService;
    private CartService cartService;

    @Override
    public void init() throws ServletException {
        plantService = PlantService.getInstance();
        cartService = CartService.getInstance();
        userSessionService = UserSessionService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        UserSession userSession = getUserSession(req);
        if (userSession != null) {
            req.setAttribute("userSession", userSession);
            req.setAttribute("cart", cartService.getCart(userSession.getUserId()));
        }

        req.setAttribute("featuredPlants", plantService.getFeaturedPlants());
        req.setAttribute("bestsellerPlants", plantService.getBestsellerPlants());
        req.setAttribute("latestPlants", plantService.getLatestPlants());
        req.getRequestDispatcher("index.jsp").forward(req,resp);
    }

    protected UserSession getUserSession(HttpServletRequest req) {
        Cookie[] cookies = req.getCookies();
        if(cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("customer_session_id")) {
                    return userSessionService.getUserSessionIfValid(cookie.getValue());
                }
            }
        }
        return null;
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}