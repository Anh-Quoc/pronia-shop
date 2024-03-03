package controllers;

import entities.UserSession;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.CartService;
import services.OrderService;
import services.UserService;

import java.io.IOException;

@WebServlet(name = "MyAccountPageController", urlPatterns = "/my-account")
public class MyAccountPageController extends HttpServlet {

    private OrderService orderService;
    private UserService userService;
    private CartService cartService;

    @Override
    public void init() throws ServletException {
        orderService = OrderService.getInstance();
        userService = UserService.getInstance();
        cartService = CartService.getInstance();
    }


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserSession userSession = (UserSession) req.getAttribute("userSession");

        req.setAttribute("cart", cartService.getCart(userSession.getUserId()));
        req.setAttribute("orders", orderService.getALlOrderByCustomerId(userSession.getUserId()));
        req.setAttribute("userInfo", userService.getUserById(userSession.getUserId()));
        req.getRequestDispatcher("my-account.jsp").forward(req, resp);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }


}
