package controllers;

import dtos.CartDTO;
import dtos.CartDetailDTO;
import entities.UserSession;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.CartService;

import java.io.IOException;
import java.util.List;
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
                break;
            case "remove":
                productId = Integer.parseInt(req.getParameter("productId"));
                cartService.removePlantFromCart(userSession.getUserId(), productId);
                break;
            case "update":
                updateCart(req, resp, userSession);
                break;
        }
        CartDTO cart = cartService.getCart(userSession.getUserId());
        req.setAttribute("cart", cart);
        req.getRequestDispatcher("cart.jsp").forward(req, resp);
    }

    protected void updateCart(HttpServletRequest req, HttpServletResponse resp, UserSession userSession) {
        String[] productIds = req.getParameterValues("productId[]");
        String[] quantities = req.getParameterValues("quantity[]");

        for (int i = 0; i < productIds.length; i++) {
            Integer productId = Integer.parseInt(productIds[i]);
            Integer quantity = Integer.parseInt(quantities[i]);
            cartService.updateCartDetailForCustomer(userSession.getUserId(), productId, quantity);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }
}
