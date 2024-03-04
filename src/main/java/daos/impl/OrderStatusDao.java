package daos.impl;

import daos.OrderStatusInterface;
import entities.OrderStatus;
import mappers.impl.OrderStatusMapper;

import java.util.List;

public class OrderStatusDao extends GenericDao<OrderStatus> implements OrderStatusInterface {

    private static final String SELECT_ORDER_STATUS_BY_ID_STATEMENT = "SELECT * FROM order_status WHERE id = ?";
    private static final String SELECT_ALL_ORDER_STATUS_STATEMENT = "SELECT * FROM order_status";
    private static OrderStatusDao instance;

    private OrderStatusDao() {

    }

    public static OrderStatusDao getInstance() {
        if (instance == null) {
            instance = new OrderStatusDao();
        }
        return instance;
    }


    @Override
    public OrderStatus getOrderStatusById(Integer id) {
        List<OrderStatus> orderStatuses = executeQuery(SELECT_ORDER_STATUS_BY_ID_STATEMENT, new OrderStatusMapper(), id);
        if(orderStatuses.isEmpty()){
            return null;
        }
        return orderStatuses.get(0);
    }

    public List<OrderStatus> getAllOrderStatus() {
        return executeQuery(SELECT_ALL_ORDER_STATUS_STATEMENT, new OrderStatusMapper());
    }

}
