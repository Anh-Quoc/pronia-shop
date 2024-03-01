package daos;

import entities.CartDetail;

import java.util.List;

public interface CartDetailDaoInterface {
    List<CartDetail> getCartDetailsByCartId(Integer cartId);

    void addNewCartDetail(CartDetail cartDetail);

    void updateCartDetailForCustomer(CartDetail cartDetail);
}
