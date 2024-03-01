package controllers;

import dtos.CartDTO;
import entities.UserSession;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.CartService;

import java.io.IOException;
import java.util.logging.Logger;

@WebServlet(name = "CartController", urlPatterns = "/cart")
public class CartController extends HttpServlet {

    private CartService cartService;

    @Override
    public void init() throws ServletException {
        cartService = CartService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }

    protected void processRequest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserSession userSession = (UserSession) req.getAttribute("userSession");
        if (userSession == null) {
            resp.sendRedirect("login");
            return;
        }

        String command = req.getParameter("command");
        if(command == null) {
            command = "view";
        }
        switch (command) {
            case "add":
                Integer productId = Integer.parseInt(req.getParameter("productId"));
                Integer quantity = Integer.parseInt(req.getParameter("quantity"));
                System.out.println("productId: " + productId);
                cartService.addPlantToCart(userSession.getUserId(), productId, quantity);
//                addToCart(req, resp, userSession);
                break;
            case "remove":
//                removeFromCart(req, resp, userSession);
                break;
            case "update":
//                updateCart(req, resp, userSession);
                break;
        }
        CartDTO cart = cartService.getCart(userSession.getUserId());
        req.setAttribute("cart", cart);
        req.getRequestDispatcher("cart.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }
}
