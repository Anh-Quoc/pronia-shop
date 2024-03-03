package controllers.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.OrderDetailService;

import java.io.IOException;

@WebServlet(name = "OrderDetailController", urlPatterns = "/admin-orderDetails")
public class OrderDetailController extends HttpServlet {

    private OrderDetailService orderDetailService;

    @Override
    public void init() throws ServletException {
        orderDetailService = OrderDetailService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String command = req.getParameter("command");
        switch (command) {
            case "READ":
                Integer orderId = Integer.parseInt(req.getParameter("orderId"));
                req.setAttribute("listOrderDetails", orderDetailService.getOrderDetailsByOrderId(orderId));
                req.getRequestDispatcher("OrderDetail.jsp").forward(req, resp);
                break;
            case "SEARCH":
                break;
            default:
                break;
        }
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }


}
