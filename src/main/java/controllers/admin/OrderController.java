package controllers.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.OrderService;

import java.io.IOException;

@WebServlet(name = "OrderController", urlPatterns = "/admin-orders")
public class OrderController extends HttpServlet {

    private OrderService orderService;

    @Override
    public void init() throws ServletException {
        orderService = OrderService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String command = req.getParameter("command");
        switch (command) {
            case "READ":
                req.setAttribute("listOrderStatus", orderService.getAllOrderStatus());
                getAllOrder(req, resp);
                break;
            case "SEARCH":
                break;
            default:
                break;
        }

    }

    private void getAllOrder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("listOrders", orderService.getAllOrders());
        req.getRequestDispatcher("Order.jsp").forward(req, resp);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String command = req.getParameter("command");
        switch (command) {
            case "UPDATE":
                Integer orderId = Integer.parseInt(req.getParameter("orderID"));
                Integer orderStatusId = Integer.parseInt(req.getParameter("orderStatusId"));
                orderService.updateOrderStatus(orderId, orderStatusId);
                getAllOrder(req, resp);
                break;
            default:
                break;
        }
    }
}
