package controllers;

import entities.UserSession;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.CartService;
import services.OrderDetailService;

import java.io.IOException;

@WebServlet(name = "OrderDetailPageController", urlPatterns = "/order-details")
public class OrderDetailPageController extends HttpServlet {

    private OrderDetailService orderDetailService;
    private CartService cartService;

    @Override
    public void init() throws ServletException {
        orderDetailService = OrderDetailService.getInstance();
        cartService = CartService.getInstance();
    }


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer orderId = Integer.parseInt(req.getParameter("orderId"));
        UserSession userSession = (UserSession) req.getAttribute("userSession");
        req.setAttribute("userSession", userSession);
        req.setAttribute("cart", cartService.getCart(userSession.getUserId()));
        req.setAttribute("listOrderDetails", orderDetailService.getOrderDetailsByOrderId(orderId));
        req.getRequestDispatcher("CustomerOrderDetail.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
