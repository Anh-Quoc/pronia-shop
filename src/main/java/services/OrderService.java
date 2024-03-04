package services;

import daos.impl.OrderDao;
import daos.impl.OrderDetailDao;
import daos.impl.OrderStatusDao;
import daos.impl.UserDao;
import dtos.OrderDTO;
import dtos.OrderDetailDTO;
import entities.Order;
import entities.OrderDetail;
import entities.User;

import java.util.List;
import java.util.Vector;

public class OrderService {

    private static OrderService instance;

    private OrderDao orderDao;
    private OrderDetailDao orderDetailDao;
    private OrderStatusDao orderStatusDao;
    private UserDao userDao;
    private OrderService() {
        orderDao = OrderDao.getInstance();
        orderDetailDao = OrderDetailDao.getInstance();
        orderStatusDao = OrderStatusDao.getInstance();
        userDao = UserDao.getInstance();
    }

    public static OrderService getInstance() {
        if (instance == null) {
            instance = new OrderService();
        }
        return instance;
    }

    public List<OrderDTO> getAllOrders() {
        List<OrderDTO> orderDTOS = new Vector<>();

        List<Order> orders = orderDao.getAllOrders();
        for(Order order : orders){
            OrderDTO orderDTO = new OrderDTO();
            List<OrderDetail> orderDetails = orderDetailDao.getOrderDetailsByOrderId(order.getId());
            orderDTO.setId(order.getId());
            orderDTO.setCountry(order.getCountry());
            orderDTO.setStreetAddress(order.getStreetAddress());
            orderDTO.setApartment(order.getApartment());
            orderDTO.setCity(order.getCity());
            orderDTO.setTotalPrice(order.getTotalPrice());
            orderDTO.setOrderDate(order.getOrderDate());
            orderDTO.setOrderDetails(orderDetails);
            orderDTO.setOrderStatus(orderStatusDao.getOrderStatusById(order.getOrderStatusId()));
            orderDTO.setCustomerId(order.getCustomerId());
            User user = userDao.getUserById(order.getCustomerId());

            orderDTO.setCustomerName(user.getFirstName() + " " + user.getLastName());
            orderDTO.setCustomerEmail(user.getEmailAddress());
            orderDTO.setCustomerPhone(user.getPhone());
            orderDTOS.add(orderDTO);

        }
        return orderDTOS;
    }


    public List<OrderDTO> getALlOrderByCustomerId(Integer customerId){
        List<OrderDTO> orderDTOS = new Vector<>();

        List<Order> orders = orderDao.getAllOrdersByCustomerId(customerId);
        for(Order order : orders){
            OrderDTO orderDTO = new OrderDTO();
            List<OrderDetail> orderDetails = orderDetailDao.getOrderDetailsByOrderId(order.getId());
            orderDTO.setId(order.getId());
            orderDTO.setCountry(order.getCountry());
            orderDTO.setStreetAddress(order.getStreetAddress());
            orderDTO.setApartment(order.getApartment());
            orderDTO.setCity(order.getCity());
            orderDTO.setTotalPrice(order.getTotalPrice());
            orderDTO.setOrderDate(order.getOrderDate());
            orderDTO.setOrderDetails(orderDetails);
            orderDTO.setOrderStatus(orderStatusDao.getOrderStatusById(order.getOrderStatusId()));
            orderDTO.setCustomerId(order.getCustomerId());
            User user = userDao.getUserById(customerId);

            orderDTO.setCustomerName(user.getFirstName() + " " + user.getLastName());
            orderDTO.setCustomerEmail(user.getEmailAddress());
            orderDTO.setCustomerPhone(user.getPhone());
            orderDTOS.add(orderDTO);

        }
        return orderDTOS;
    }

    public Integer addOrder(Order order){
        return orderDao.insertOrder(order);
    }

}
