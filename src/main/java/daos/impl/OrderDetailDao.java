package daos.impl;

import daos.OrderDetailDaoInterface;
import entities.OrderDetail;
import mappers.impl.OrderDetailMapper;

import java.util.List;

public class OrderDetailDao extends GenericDao<OrderDetail> implements OrderDetailDaoInterface {

    private static final String SELECT_ORDER_DETAILS_BY_ORDER_ID_STATEMENT = "SELECT * FROM order_detail WHERE order_id = ?";
    private static final String INSERT_ORDER_DETAIL_STATEMENT = "INSERT INTO order_detail (product_id, quantity, subtotal, order_id) VALUES (?, ?, ?, ?)";

    private static OrderDetailDao instance;

    private OrderDetailDao() {

    }

    public static OrderDetailDao getInstance() {
        if (instance == null) {
            instance = new OrderDetailDao();
        }
        return instance;
    }

    @Override
    public List<OrderDetail> getOrderDetailsByOrderId(Integer orderId) {
        return executeQuery(SELECT_ORDER_DETAILS_BY_ORDER_ID_STATEMENT, new OrderDetailMapper(), orderId);
    }

    public void insertOrderDetail(OrderDetail orderDetail) {
        executeUpdate(INSERT_ORDER_DETAIL_STATEMENT, orderDetail.getProductId(), orderDetail.getQuantity(), orderDetail.getSubtotal(), orderDetail.getOrderId());
    }

}
