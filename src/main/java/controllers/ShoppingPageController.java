package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.PlantService;

import java.io.IOException;

@WebServlet(name = "ShoppingPageController", urlPatterns = "/shop")
public class ShoppingPageController extends HttpServlet {

    private PlantService plantService;

    @Override
    public void init() throws ServletException {
        plantService = new PlantService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("listPlants", plantService.getAllPlant());
        req.getRequestDispatcher("shop.jsp").forward(req, resp);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String productTitle = req.getParameter("searchValue");
        if(productTitle != null && !productTitle.isEmpty()){
            req.setAttribute("listPlants", plantService.searchPlantByTitle(productTitle));
            req.getRequestDispatcher("shop.jsp").forward(req, resp);
        }
    }


}
