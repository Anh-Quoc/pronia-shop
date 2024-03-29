package daos.impl;

import daos.OrderDaoInterface;
import entities.Order;
import mappers.impl.OrderMapper;

import java.util.List;

public class OrderDao extends GenericDao<Order> implements OrderDaoInterface {

    private static final String SELECT_ALL_ORDERS_STATEMENT = "SELECT * FROM orders ORDER BY order_date DESC";

    private static final String SELECT_ORDERS_BY_CUSTOMER_ID_STATEMENT = "SELECT * FROM orders WHERE customer_id = ? ORDER BY order_date DESC";

    private static final String INSERT_ORDER_STATEMENT = "INSERT INTO orders (country, street_address, apartment, city, total_price, order_date, customer_id) VALUES (?, ?, ?, ?, ?, ?, ?)";

    private static final String UPDATE_ORDER_STATUS_STATEMENT = "UPDATE orders SET order_status_id = ? WHERE id = ?";
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

    public Integer insertOrder(Order order) {
       return executeUpdate(INSERT_ORDER_STATEMENT, order.getCountry(), order.getStreetAddress(), order.getApartment(), order.getCity(), order.getTotalPrice(), order.getOrderDate(), order.getCustomerId());
    }

    public void updateOrderStatus(Integer orderId, Integer orderStatusId) {

        executeUpdate(UPDATE_ORDER_STATUS_STATEMENT, orderStatusId, orderId);
    }

}
