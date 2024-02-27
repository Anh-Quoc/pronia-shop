package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.PlantService;

import java.io.IOException;

@WebServlet(name = "HomePageController", urlPatterns = {"/home", "/index"})
public class HomePageController extends HttpServlet {

    private PlantService plantService;

    @Override
    public void init() throws ServletException {
        plantService = PlantService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("featuredPlants", plantService.getFeaturedPlants());
        req.setAttribute("bestsellerPlants", plantService.getBestsellerPlants());
        req.setAttribute("latestPlants", plantService.getLatestPlants());
        req.getRequestDispatcher("index.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}