package mappers.impl;

import entities.Cart;
import mappers.RowMapperInterface;

import java.sql.ResultSet;

public class CartMapper implements RowMapperInterface<Cart> {
    @Override
    public Cart mapRow(ResultSet rs) {
        try {
            Cart cart = new Cart();
            cart.setId(rs.getInt("id"));
            cart.setCustomerId(rs.getInt("customer_id"));
            cart.setTotalPrice(rs.getDouble("total_price"));
            return cart;
        } catch (Exception e) {
            return null;
        }
    }
}
