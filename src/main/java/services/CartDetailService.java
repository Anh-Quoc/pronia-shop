package services;

import daos.impl.CartDetailDao;
import dtos.CartDetailDTO;
import entities.CartDetail;

public class CartDetailService {

    private CartDetailDao cartDetailDao;
    private static CartDetailService instance;

    private CartDetailService() {
        cartDetailDao = CartDetailDao.getInstance();
    }

    public void updateCartDetailForCustomer(CartDetailDTO cartDetailDTO) {
        CartDetail cartDetail = new CartDetail();
        cartDetail.setId(cartDetailDTO.getId());
        cartDetail.setCartId(cartDetailDTO.getCartId());
        cartDetail.setProductId(cartDetailDTO.getProductId());
        cartDetail.setQuantity(cartDetailDTO.getQuantity());
        cartDetail.setSubTotal(cartDetailDTO.getSubTotal());

        cartDetailDao.updateCartDetailForCustomer(cartDetail);
    }

    public void deleteCartDetailForCustomer(Integer cartDetailId) {
        cartDetailDao.deleteCartDetailByCartId(cartDetailId);
    }

}
