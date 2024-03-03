package mappers.impl;

import entities.Order;
import mappers.RowMapperInterface;

import java.sql.ResultSet;

public class OrderMapper implements RowMapperInterface<Order> {
    @Override
    public Order mapRow(ResultSet rs) {
        try {
            Integer id = rs.getInt("id");
            String country = rs.getString("country");
            String streetAddress = rs.getString("street_address");
            String apartment = rs.getString("apartment");
            String city = rs.getString("city");
            String postcode = rs.getString("postcode");
            Double totalPrice = rs.getDouble("total_price");
            java.sql.Date orderDate = rs.getDate("order_date");
            Integer orderStatusId = rs.getInt("order_status_id");
            Integer customerId = rs.getInt("customer_id");
            return new Order(id, country, streetAddress, apartment, city, postcode, totalPrice, orderDate, orderStatusId, customerId);
        } catch (Exception e) {
            return null;
        }
    }
}
