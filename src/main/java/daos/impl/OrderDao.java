package daos.impl;

import daos.OrderDaoInterface;
import entities.Order;
import mappers.impl.OrderMapper;

import java.util.List;

public class OrderDao extends GenericDao<Order> implements OrderDaoInterface {

    private static final String SELECT_ALL_ORDERS_STATEMENT = "SELECT * FROM orders";

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

}
