package controllers;

import daos.PlantDAO;
import daos.PlantTagDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.PlantService;
import services.PlantTagService;

import java.io.IOException;

@WebServlet(name = "ShoppingPageController", urlPatterns = "/shop")
public class ShoppingPageController extends HttpServlet {

    private PlantService plantService;
    private PlantTagService plantTagService;

    @Override
    public void init() throws ServletException {
        plantService = new PlantService();
        plantTagService = PlantTagService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String category = req.getParameter("category");
        String color = req.getParameter("color");
        String tag = req.getParameter("tag");

        String sortType = req.getParameter("sortType");

        if(category == null || category.isEmpty()){
            category = "all";
        }
        if(color == null || color.isEmpty()){
            color = "all";
        }
        if(tag == null || tag.isEmpty()){
            tag = "all";
        }
        if(sortType == null || sortType.isEmpty()){
            sortType = "default";
        }
    // SELECT * FROM plants WHERE plants.title LIKE '%%' AND category = ? AND color = ? AND tag = ?
        req.setAttribute("listPlantTag", plantTagService.getTop6TagHasPlant());
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
