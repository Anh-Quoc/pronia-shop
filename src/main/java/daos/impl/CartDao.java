package daos.impl;

import daos.CartDaoInterface;
import entities.Cart;
import mappers.impl.CartMapper;

import java.util.List;

public class CartDao extends GenericDao<Cart> implements CartDaoInterface {

    private final String SELECT_CART_BY_CUSTOMER_ID_STATEMENT = "SELECT * FROM carts WHERE customer_id = ?";

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
}
