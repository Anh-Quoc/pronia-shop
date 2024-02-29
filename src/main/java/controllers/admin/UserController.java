package controllers.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.UserService;

import java.io.IOException;

@WebServlet(name = "UserController", urlPatterns = "/admin-users")
public class UserController extends HttpServlet {

    private UserService userService;

    @Override
    public void init() throws ServletException {
        userService = UserService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       String command = req.getParameter("command");
       switch (command){
           case "READ":
               getAllUser(req, resp);
               break;
           case "DELETE":
//               int id = Integer.parseInt(req.getParameter("userID"));
//               userDAO.deleteUserByID(id);
//               getAllUser(req, resp);
               break;
           case "SEARCH":
               String search = req.getParameter("searchValue");
//               req.setAttribute("listUsers", userDAO.searchUserByName(search));
               req.getRequestDispatcher("User.jsp").forward(req, resp);
               break;
           default:
               break;
       }


    }

    private void getAllUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("listUsers", userService.getAllUser());
        req.getRequestDispatcher("User.jsp").forward(req, resp);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String command = req.getParameter("command");
        switch (command){
            case "CREATE":
//                userDAO.createNewUser(req);
                getAllUser(req, resp);
                break;
            case "UPDATE":
//                userDAO.updateUserByID(req);
                getAllUser(req, resp);
                break;
            default:
                break;
        }
    }
}
