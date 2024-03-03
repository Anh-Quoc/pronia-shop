package daos;

import entities.Order;

import java.util.List;

public interface OrderDaoInterface {
    List<Order> getAllOrders();
    List<Order> getAllOrdersByCustomerId(Integer customerId);
}
