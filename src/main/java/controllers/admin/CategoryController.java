package controllers.admin;


import dtos.CategoryDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.PlantCategoryService;

import java.io.IOException;

@WebServlet(name = "CategoryController", urlPatterns = "/admin-categories")
public class CategoryController extends HttpServlet {

    private PlantCategoryService plantCategoryService;

    @Override
    public void init() throws ServletException {
        plantCategoryService = PlantCategoryService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String command = req.getParameter("command");
        switch (command) {
            case "READ":
                getAllCategory(req, resp);
                break;
            case "DELETE":
                int id = Integer.parseInt(req.getParameter("categoryID"));
                CategoryDTO categoryDTO = new CategoryDTO();
                categoryDTO.setId(id);
                plantCategoryService.deleteCategory(categoryDTO);
                getAllCategory(req, resp);
                break;
            case "SEARCH":
                String search = req.getParameter("searchValue");
//                req.setAttribute("listCategories", plantCategoryDAO.searchCategoryByName(search));
                req.getRequestDispatcher("Category.jsp").forward(req, resp);
                break;
            default:
                break;
        }
    }

    private void getAllCategory(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("listCategories", plantCategoryService.getAllPlantCategory());
        req.getRequestDispatcher("Category.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String command = req.getParameter("command");
        switch (command) {
            case "CREATE":
                CategoryDTO categoryDTO = new CategoryDTO(req.getParameter("nameCategory"));
                plantCategoryService.createNewCategory(categoryDTO);
                getAllCategory(req, resp);
                break;
            case "UPDATE":
                Integer id = Integer.parseInt(req.getParameter("categoryID"));
                categoryDTO = new CategoryDTO(id, req.getParameter("categoryName"));
                plantCategoryService.updateCategory(categoryDTO);
                getAllCategory(req, resp);
                break;
        }
    }
}
