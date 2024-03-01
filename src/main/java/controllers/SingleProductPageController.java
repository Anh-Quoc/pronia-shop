package controllers;

import dtos.PlantDTO;
import entities.UserSession;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.CartService;
import services.PlantService;
import services.UserSessionService;

import java.io.IOException;
import java.util.List;

@WebServlet(name="SingleProductPageController", urlPatterns = {"/plants"})
public class SingleProductPageController extends HttpServlet {
    private PlantService plantService;

    private UserSessionService userSessionService;
    private CartService cartService;

    @Override
    public void init() throws ServletException {
        plantService = PlantService.getInstance();
        userSessionService = UserSessionService.getInstance();
        cartService = CartService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        getCart(req);
        int plantId = Integer.parseInt(req.getParameter("id"));
        PlantDTO plant = plantService.getPlantById(plantId);
        List<PlantDTO> relatedPlants = plantService.getRelatedPlant(plantId);
        if(plant != null) {
            req.setAttribute("plant", plant);
            req.setAttribute("relatedPlants", relatedPlants);
            try {
                req.getRequestDispatcher("single-product.jsp").forward(req, resp);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        } else {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    protected void getCart(HttpServletRequest req) {
        UserSession userSession = getUserSession(req);
        if (userSession != null) {
            req.setAttribute("userSession", userSession);
            req.setAttribute("cart", cartService.getCart(userSession.getUserId()));
        }

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
