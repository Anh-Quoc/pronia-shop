package daos.impl;

import daos.CartDaoInterface;
import entities.Cart;
import mappers.impl.CartMapper;

import java.util.List;

public class CartDao extends GenericDao<Cart> implements CartDaoInterface {

    private final String SELECT_CART_BY_CUSTOMER_ID_STATEMENT = "SELECT * FROM carts WHERE customer_id = ?";
    private final String UPDATE_CART_TOTAL_PRICE_STATEMENT = "UPDATE carts SET total_price = " +
            "(SELECT CASE WHEN SUM(sub_total) IS NULL THEN 0 ELSE SUM(sub_total) END AS subtotal FROM cart_detail WHERE cart_id = carts.id)"+
            "WHERE id = ?";
    private final String INSERT_CART_STATEMENT = "INSERT INTO carts (customer_id) VALUES (?)";
    private static CartDao instance;

    private CartDao() {
    }

    public static CartDao getInstance() {
        if (instance == null) {
            instance = new CartDao();
        }
        return instance;
    }

    @Override
    public Cart getCartByCustomerId(Integer customerId) {
        List<Cart> carts = executeQuery(SELECT_CART_BY_CUSTOMER_ID_STATEMENT, new CartMapper(), customerId);
        return carts.isEmpty() ? null : carts.get(0);
    }

    public void saveCart(Cart cart) {
        executeUpdate(INSERT_CART_STATEMENT, cart.getCustomerId());
    }

    public void updateCartTotalPrice(Integer cartId) {
        executeUpdate(UPDATE_CART_TOTAL_PRICE_STATEMENT, cartId);
    }

}
