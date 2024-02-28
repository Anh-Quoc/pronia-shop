package controllers.admin;


import dtos.TagDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.PlantTagService;

import java.io.IOException;

@WebServlet(name = "TagController", urlPatterns = "/admin-tags")
public class TagController extends HttpServlet {

    private PlantTagService plantTagService;

    @Override
    public void init() throws ServletException {
        plantTagService = PlantTagService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String command = req.getParameter("command");
        switch (command) {
            case "READ":
                getAllTag(req, resp);
                break;
            case "DELETE":
                int id = Integer.parseInt(req.getParameter("tagID"));
//                plantTagService.deleteTagByID(id);
                getAllTag(req, resp);
                break;
            case "SEARCH":
                String search = req.getParameter("searchValue");
//                req.setAttribute("listTags", plantTagService.searchTagByName(search));
                req.getRequestDispatcher("Tag.jsp").forward(req, resp);
                break;
            default:
                break;
        }
    }

    private void getAllTag(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("listTags", plantTagService.getAllPlantTag());
        req.getRequestDispatcher("Tag.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String command = req.getParameter("command");
        switch (command) {
            case "CREATE":
                String name = req.getParameter("name");
                TagDTO tagDTO = new TagDTO(name);
                plantTagService.createNewTag(tagDTO);
                getAllTag(req, resp);
                break;
            case "UPDATE":
                Integer id = Integer.parseInt(req.getParameter("tagID"));
                String nameUpdate = req.getParameter("name");
//                plantTagService.updateTagByID(id, nameUpdate);
                getAllTag(req, resp);
                break;
            default:
                break;
        }

    }
}
