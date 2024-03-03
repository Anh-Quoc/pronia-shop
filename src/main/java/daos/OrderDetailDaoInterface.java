package daos;

import entities.OrderDetail;

import java.util.List;

public interface OrderDetailDaoInterface {
    List<OrderDetail> getOrderDetailsByOrderId(Integer orderId);
}
