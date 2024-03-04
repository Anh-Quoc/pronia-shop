package controllers;

import dtos.CartDTO;
import dtos.OrderDTO;
import entities.Order;
import entities.OrderDetail;
import entities.User;
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

@WebServlet(name = "CheckoutPageController", value = "/checkout")
public class CheckoutPageController extends HttpServlet {

    private UserService userService;
    private CartService cartService;
    private OrderService orderService;

    @Override
    public void init() throws ServletException {
        userService = UserService.getInstance();
        cartService = CartService.getInstance();
    }


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserSession userSession = (UserSession) req.getAttribute("userSession");
        if (userSession == null) {
            resp.sendRedirect("login");
            return;
        }
        req.setAttribute("userSession", userSession);
        User user = userService.getUserById(userSession.getUserId());
        req.setAttribute("user", user);
        req.setAttribute("cart", cartService.getCart(userSession.getUserId()));
        req.getRequestDispatcher("checkout.jsp").forward(req, resp);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String country = req.getParameter("country");
        String address = req.getParameter("streetAddress");
        String apartment = req.getParameter("apartment");
        String city = req.getParameter("city");

        UserSession userSession = (UserSession) req.getAttribute("userSession");
        if (userSession == null) {
            resp.sendRedirect("login");
            return;
        }
        User user = userService.getUserById(userSession.getUserId());
        CartDTO cart = cartService.getCart(userSession.getUserId());
        if(cart.getCartDetails().isEmpty()) {
            resp.sendRedirect("cart");
            return;
        }
        Order order = new Order();
        order.setCountry(country);
        order.setStreetAddress(address);
        order.setApartment(apartment);
        order.setCity(city);

        order.setTotalPrice(cart.getTotalPrice());
        order.setOrderDate(new java.sql.Date(System.currentTimeMillis()));
        order.setCustomerId(user.getId());

        Integer orderId = cartService.checkoutCart(order, cart);

        resp.sendRedirect("order-details?orderId=" + orderId);
    }
}
