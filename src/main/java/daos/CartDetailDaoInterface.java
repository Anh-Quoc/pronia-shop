package daos;

import entities.CartDetail;

import java.util.List;

public interface CartDetailDaoInterface {
    List<CartDetail> getCartDetailsByCartId(Integer cartId);

    void saveCartDetail(CartDetail cartDetail);
    CartDetail getCartDetailByProductIdAndCartId(Integer productId, Integer cartId);
    void updateCartDetailForCustomer(CartDetail cartDetail);
}
