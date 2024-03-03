package daos.impl;

import daos.OrderDaoInterface;
import entities.Order;
import mappers.impl.OrderMapper;

import java.util.List;

public class OrderDao extends GenericDao<Order> implements OrderDaoInterface {

    private static final String SELECT_ALL_ORDERS_STATEMENT = "SELECT * FROM orders ORDER BY order_date DESC";

    private static final String SELECT_ORDERS_BY_CUSTOMER_ID_STATEMENT = "SELECT * FROM orders WHERE customer_id = ? ORDER BY order_date DESC";

    private static OrderDao instance;

    private OrderDao() {

    }

    public static OrderDao getInstance() {
        if (instance == null) {
            instance = new OrderDao();
        }
        return instance;
    }

    @Override
    public List<Order> getAllOrders() {
        return executeQuery(SELECT_ALL_ORDERS_STATEMENT, new OrderMapper());
    }

    @Override
    public List<Order> getAllOrdersByCustomerId(Integer customerId) {
        return executeQuery(SELECT_ORDERS_BY_CUSTOMER_ID_STATEMENT, new OrderMapper(), customerId);
    }

}
