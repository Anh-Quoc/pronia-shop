package mappers.impl;

import entities.OrderStatus;
import mappers.RowMapperInterface;

import java.sql.ResultSet;

public class OrderStatusMapper implements RowMapperInterface<OrderStatus> {

    @Override
    public OrderStatus mapRow(ResultSet rs) {
        try {
            Integer id = rs.getInt("id");
            String name = rs.getString("name");
            return new OrderStatus(id, name);
        } catch (Exception e) {
            return null;
        }
    }
}
