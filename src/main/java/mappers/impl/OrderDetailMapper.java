package mappers.impl;

import entities.OrderDetail;
import mappers.RowMapperInterface;

import java.sql.ResultSet;

public class OrderDetailMapper implements RowMapperInterface<OrderDetail> {

    @Override
    public OrderDetail mapRow(ResultSet rs) {
        try {
            Integer id = rs.getInt("id");
            Integer productId = rs.getInt("product_id");
            Integer quantity = rs.getInt("quantity");
            Double subtotal = rs.getDouble("subtotal");
            Integer orderId = rs.getInt("order_id");
            return new OrderDetail(id, productId, quantity, subtotal, orderId);
        } catch (Exception e) {
            return null;
        }
    }
}
