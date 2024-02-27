package controllers.admin;

import dtos.CategoryDTO;
import dtos.PlantDTO;
import dtos.TagDTO;
import entities.Category;
import entities.Tag;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mappers.impl.CategoryMapper;
import mappers.impl.PlantMapper;
import mappers.impl.TagMapper;
import services.PlantCategoryService;
import services.PlantService;
import services.PlantTagService;

import java.io.IOException;
import java.sql.Date;
import java.util.Arrays;
import java.util.List;
import java.util.Vector;

import static java.util.stream.Collectors.toList;

@WebServlet(name = "PlantController", urlPatterns = "/admin-plants")
public class PlantController extends HttpServlet {

    private PlantService plantService;
    private PlantTagService plantTagService;
    private PlantCategoryService plantCategoryService;


    @Override
    public void init() throws ServletException {
        plantService = PlantService.getInstance();
        plantTagService = PlantTagService.getInstance();
        plantCategoryService = PlantCategoryService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String command = req.getParameter("command");

        switch (command) {
            case "READ":
                getAllPlant(req, resp);
                break;
            case "DELETE":
                int id = Integer.parseInt(req.getParameter("plantID"));
                plantService.deletePlantByID(id);
                getAllPlant(req, resp);
                break;
            case "SEARCH":
                String searchValue = req.getParameter("searchValue");
                req.setAttribute("listPlants", plantService.searchPlantByName(searchValue));
                req.setAttribute("listPlantCategories", plantCategoryService.getAllPlantCategory());
                req.setAttribute("listPlantTags", plantTagService.getAllPlantTag());
                req.getRequestDispatcher("Plant.jsp").forward(req, resp);
                break;
//            case "SEARCH_BY_PRICE":
//                Integer minPrice = Integer.parseInt(req.getParameter("minValue"));
//                Integer maxPrice = Integer.parseInt(req.getParameter("maxValue"));
//                req.setAttribute("listPlants", plantService.searchPlantByPrice(minPrice, maxPrice));
//                req.setAttribute("listPlantCategories", plantCategoryService.getAllPlantCategory());
//                req.setAttribute("listPlantTags", plantTagService.getAllPlantTag());
//                req.getRequestDispatcher("Plant.jsp").forward(req, resp);
//                break;
            default:
                break;
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String command = req.getParameter("command");
        switch (command) {
            case "CREATE":
                plantService.createNewPlant(getPlantDTOFromRequest(req));
                getAllPlant(req, resp);
                break;
            case "UPDATE":
//                plantService.updatePlant(req);
                getAllPlant(req, resp);
                break;

            default:
                break;
        }
    }

    private PlantDTO getPlantDTOFromRequest(HttpServletRequest req) {
        PlantDTO plantDTO = new PlantDTO();
        plantDTO.setTitle(req.getParameter("title"));
        plantDTO.setDescription(req.getParameter("description"));
        plantDTO.setImageLink(req.getParameter("imageLink"));
        plantDTO.setColor(req.getParameter("color"));
        plantDTO.setUnitPrice(Double.parseDouble(req.getParameter("unitPrice")));


        String[] categories = req.getParameterValues("plantCategories[]");
        List<CategoryDTO> listCategory = Arrays.stream(categories).map(CategoryDTO::new).collect(toList());
        plantDTO.setPlantCategories(listCategory);

        String[] tags = req.getParameterValues("plantTags[]");
        List<TagDTO> listTag = Arrays.stream(tags).map(TagDTO::new).collect(toList());
        plantDTO.setPlantTags(listTag);


        plantDTO.setQuantity(Integer.parseInt(req.getParameter("quantity")));
        plantDTO.setSaleOpening(java.sql.Date.valueOf(req.getParameter("saleOpening")));
        plantDTO.setStockStatus(req.getParameter("stockStatus"));
        plantDTO.setActive(Boolean.parseBoolean(req.getParameter("isActive")));
        return plantDTO;
    }


    private void getAllPlant(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("listPlants", plantService.getAllPlant());
        req.setAttribute("listPlantCategories", plantCategoryService.getAllPlantCategory());
        req.setAttribute("listPlantTags", plantTagService.getAllPlantTag());
        req.getRequestDispatcher("Plant.jsp").forward(req, resp);
    }
}
