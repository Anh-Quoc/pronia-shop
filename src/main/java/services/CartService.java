package services;

import daos.impl.CartDao;
import daos.impl.CartDetailDao;
import dtos.CartDTO;
import dtos.CartDetailDTO;
import dtos.PlantDTO;
import entities.Cart;
import entities.CartDetail;


import java.util.List;
import java.util.Vector;


public class CartService {

    private CartDao cartDao;
    private CartDetailDao cartDetailDao;
    private PlantService plantService;

    private static CartService instance;

    private CartService() {
        cartDao = CartDao.getInstance();
        cartDetailDao = CartDetailDao.getInstance();
        plantService = PlantService.getInstance();
    }

    public static CartService getInstance() {
        if (instance == null) {
            instance = new CartService();
        }
        return instance;
    }

    public CartDTO getCart(Integer customerId) {
        Cart cart = cartDao.getCartByCustomerId(customerId);
        List<CartDetail> cartDetails = cartDetailDao.getCartDetailsByCartId(cart.getId());

        List<CartDetailDTO> cartDetailDTOS = new Vector<>();
        for(CartDetail cartDetail : cartDetails) {
            PlantDTO plant = plantService.getPlantById(cartDetail.getProductId());

            CartDetailDTO cartDetailDTO;
            if(plant != null) {
                cartDetailDTO = new CartDetailDTO();
                cartDetailDTO.setId(cartDetail.getId());
                cartDetailDTO.setProductId(plant.getId());
                cartDetailDTO.setProductName(plant.getTitle());
                cartDetailDTO.setProductImage(plant.getImageLink());
                cartDetailDTO.setProductPrice(plant.getUnitPrice());
                cartDetailDTO.setCartId(cartDetail.getCartId());
                cartDetailDTO.setQuantity(cartDetail.getQuantity());
                cartDetailDTO.setSubTotal(cartDetail.getSubTotal());

                cartDetailDTOS.add(cartDetailDTO);
            }
        }

        CartDTO cartDTO = new CartDTO();
        cartDTO.setId(cart.getId());
        cartDTO.setCustomerId(cart.getCustomerId());
        cartDTO.setCartDetails(cartDetailDTOS);
        cartDTO.setTotalPrice(cart.getTotalPrice());

        return cartDTO;
    }


    public void addPlantToCart(Integer customerId, Integer productId, Integer quantity) {

        Cart cart = cartDao.getCartByCustomerId(customerId);
        PlantDTO plant = plantService.getPlantById(productId);

        if(plant == null) {
            return;
        }
        CartDetail cartDetail = cartDetailDao.getCartDetailByProductIdAndCartId(productId, cart.getId());
        if(cartDetail == null){
            cartDetail = new CartDetail();
            cartDetail.setCartId(cart.getId());
            cartDetail.setProductId(plant.getId());
            cartDetail.setQuantity(quantity);
            cartDetail.setSubTotal(plant.getUnitPrice() * quantity);
            cartDetailDao.saveCartDetail(cartDetail);
            cartDao.updateCartTotalPrice(cart.getId(), cart.getTotalPrice() + cartDetail.getSubTotal());
        } else {
            cartDetail.setQuantity(cartDetail.getQuantity() + quantity);
            cartDetail.setSubTotal(plant.getUnitPrice() * cartDetail.getQuantity());
            cartDetailDao.updateCartDetailForCustomer(cartDetail);
            cartDao.updateCartTotalPrice(cart.getId(), cart.getTotalPrice() + plant.getUnitPrice());
        }

    }

}
