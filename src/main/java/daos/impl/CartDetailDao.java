package daos.impl;

import daos.CartDetailDaoInterface;
import entities.CartDetail;
import mappers.impl.CartDetailMapper;

import java.util.List;

public class CartDetailDao extends GenericDao<CartDetail> implements CartDetailDaoInterface {
    private final String GET_CART_DETAILS_BY_CART_ID = "SELECT * FROM cart_detail WHERE cart_id = ?";

    private static CartDetailDao instance;

    private CartDetailDao() {
    }

    public static CartDetailDao getInstance() {
        if (instance == null) {
            instance = new CartDetailDao();
        }
        return instance;
    }

    @Override
    public List<CartDetail> getCartDetailsByCartId(Integer cartId) {
        return executeQuery(GET_CART_DETAILS_BY_CART_ID, new CartDetailMapper(), cartId);
    }

    @Override
    public void addNewCartDetail(CartDetail cartDetail) {

    }

    @Override
    public void updateCartDetailForCustomer(CartDetail cartDetail) {

    }


}
