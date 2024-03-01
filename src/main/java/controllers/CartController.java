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

@WebServlet(name = "CartController", urlPatterns = "/cart")
public class CartController extends HttpServlet {

    private CartService cartService;

    @Override
    public void init() throws ServletException {
        cartService = CartService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserSession userSession = (UserSession) req.getAttribute("userSession");
        if (userSession == null) {
            resp.sendRedirect("login");
            return;
        }
        CartDTO cart = cartService.getCart(userSession.getUserId());
        req.setAttribute("cart", cart);
        req.getRequestDispatcher("cart.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
