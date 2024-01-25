package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.PlantService;

import java.io.IOException;
@WebServlet(name="SingleProductPageController", urlPatterns = {"/plants"})
public class SingleProductPageController extends HttpServlet {
    private PlantService plantService;

    @Override
    public void init() throws ServletException {
        plantService = new PlantService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int plantId = Integer.parseInt(req.getParameter("id"));
        req.setAttribute("plant", plantService.getPlantById(plantId));
        try {
            req.getRequestDispatcher("single-product.jsp").forward(req,resp);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
