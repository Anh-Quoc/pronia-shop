package controllers;

import dtos.CartDTO;
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
import services.PlantTagService;
import services.UserSessionService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ShoppingPageController", urlPatterns = "/shop")
public class ShoppingPageController extends HttpServlet {

    private PlantService plantService;
    private PlantTagService plantTagService;
    private UserSessionService userSessionService;
    private CartService cartService;

    @Override
    public void init() throws ServletException {
        plantService = PlantService.getInstance();
        plantTagService = PlantTagService.getInstance();
        userSessionService = UserSessionService.getInstance();
        cartService = CartService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

//        String category = req.getParameter("category");
//        String color = req.getParameter("color");
//        String tag = req.getParameter("tag");
//
        String sortType = req.getParameter("sortType");
//
//        if(category == null || category.isEmpty()){
//            category = "all";
//        }
//        if(color == null || color.isEmpty()){
//            color = "all";
//        }
//        if(tag == null || tag.isEmpty()){
//            tag = "all";
//        }
        if(sortType == null || sortType.isEmpty()){
            sortType = "default";
        }


    // SELECT * FROM plants WHERE plants.title LIKE '%%' AND category = ? AND color = ? AND tag = ?
//        req.setAttribute("listPlantCategories", plantService.getTop6CategoryHasPlant());
//        req.setAttribute("listPlantTag", plantTagService.getTop6TagHasPlant());



        String page = req.getParameter("page");
        if(page == null || page.isEmpty()){
            page = "1";
        }
        Integer pageInt = Integer.parseInt(page);
        List<PlantDTO> listPlants = listPlants = plantService.getAllActivePlants(pageInt);
        switch (sortType){
            case "default":
                break;
            case "price-asc":
                listPlants = plantService.getAllActivePlantsOrderByPriceAsc();
                break;
            case "price-desc":
                listPlants = plantService.getAllActivePlantsOrderByPriceDesc();
                break;
        }


        getCart(req);
        req.setAttribute("numberOfPage", plantService.getNumberOfPages());
        req.setAttribute("currentPage", page);
        req.setAttribute("listPlants", listPlants);
        req.getRequestDispatcher("shop.jsp").forward(req, resp);
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
        getCart(req);
        String productTitle = req.getParameter("searchValue");
        if(productTitle != null && !productTitle.isEmpty()){
            req.setAttribute("listPlants", plantService.searchPlantByName(productTitle));
            req.getRequestDispatcher("shop.jsp").forward(req, resp);
        }
    }


}
