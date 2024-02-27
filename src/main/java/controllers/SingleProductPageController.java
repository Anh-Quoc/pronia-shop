package controllers;

import dtos.PlantDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.PlantService;

import java.io.IOException;
import java.util.List;

@WebServlet(name="SingleProductPageController", urlPatterns = {"/plants"})
public class SingleProductPageController extends HttpServlet {
    private PlantService plantService;

    @Override
    public void init() throws ServletException {
        plantService = PlantService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
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

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
