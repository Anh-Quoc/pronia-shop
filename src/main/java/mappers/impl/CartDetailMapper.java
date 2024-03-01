package mappers.impl;

import entities.CartDetail;
import mappers.RowMapperInterface;

import java.sql.ResultSet;

public class CartDetailMapper implements RowMapperInterface<CartDetail> {
    @Override
    public CartDetail mapRow(ResultSet rs) {
        try {
            CartDetail cartDetail = new CartDetail();
            cartDetail.setId(rs.getInt("id"));
            cartDetail.setProductId(rs.getInt("product_id"));
            cartDetail.setQuantity(rs.getInt("quantity"));
            cartDetail.setCartId(rs.getInt("cart_id"));
            cartDetail.setSubTotal(rs.getDouble("sub_total"));
            return cartDetail;
        } catch (Exception e) {
            return null;
        }
    }
}
