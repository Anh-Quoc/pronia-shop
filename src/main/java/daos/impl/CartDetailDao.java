package daos.impl;

import daos.CartDetailDaoInterface;
import entities.CartDetail;
import mappers.impl.CartDetailMapper;

import java.util.List;

public class CartDetailDao extends GenericDao<CartDetail> implements CartDetailDaoInterface {
    private final String GET_CART_DETAILS_BY_CART_ID = "SELECT * FROM cart_detail WHERE cart_id = ?";

    private final String INSERT_CART_DETAIL_STATEMENT = "INSERT INTO cart_detail (product_id, quantity, cart_id, sub_total) VALUES (?, ?, ?, ?)";
    private final String SELECT_CART_DETAIL_BY_PRODUCT_ID_STATEMENT = "SELECT * FROM cart_detail WHERE product_id = ? AND cart_id = ?";

    private final String UPDATE_CART_DETAIL_STATEMENT = "UPDATE cart_detail SET quantity = ?, sub_total = ? WHERE product_id = ? AND cart_id = ?";
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
    public CartDetail getCartDetailByProductIdAndCartId(Integer productId, Integer cartId) {
        List<CartDetail> result = executeQuery(SELECT_CART_DETAIL_BY_PRODUCT_ID_STATEMENT, new CartDetailMapper(), productId, cartId);
        if (result == null || result.isEmpty()) {
            return null;
        }
        return result.get(0);
    }

    @Override
    public void saveCartDetail(CartDetail cartDetail) {
        executeUpdate(INSERT_CART_DETAIL_STATEMENT, cartDetail.getProductId(), cartDetail.getQuantity(), cartDetail.getCartId(), cartDetail.getSubTotal());
    }

    @Override
    public void updateCartDetailForCustomer(CartDetail cartDetail) {
        executeUpdate(UPDATE_CART_DETAIL_STATEMENT, cartDetail.getQuantity(), cartDetail.getSubTotal(), cartDetail.getProductId(), cartDetail.getCartId());
    }


}
