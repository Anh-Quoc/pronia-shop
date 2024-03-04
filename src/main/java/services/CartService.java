package services;

import daos.impl.CartDao;
import daos.impl.CartDetailDao;
import dtos.CartDTO;
import dtos.CartDetailDTO;
import dtos.PlantDTO;
import entities.Cart;
import entities.CartDetail;
import entities.Order;
import entities.OrderDetail;


import java.util.List;
import java.util.Vector;


public class CartService {

    private CartDao cartDao;
    private CartDetailDao cartDetailDao;
    private PlantService plantService;

    private OrderService orderService;
    private OrderDetailService orderDetailService;

    private static CartService instance;

    private CartService() {
        cartDao = CartDao.getInstance();
        cartDetailDao = CartDetailDao.getInstance();
        plantService = PlantService.getInstance();
        orderService = OrderService.getInstance();
        orderDetailService = OrderDetailService.getInstance();
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
            cartDao.updateCartTotalPrice(cart.getId());
        } else {
            cartDetail.setQuantity(cartDetail.getQuantity() + quantity);
            cartDetail.setSubTotal(plant.getUnitPrice() * cartDetail.getQuantity());
            cartDetailDao.updateCartDetailForCustomer(cartDetail);
            cartDao.updateCartTotalPrice(cart.getId());
        }

    }

    public void updateCartDetailForCustomer(Integer customerId, Integer productId, Integer quantity) {
        Cart cart = cartDao.getCartByCustomerId(customerId);
        PlantDTO plant = plantService.getPlantById(productId);
        if(plant == null) {
            return;
        }
        CartDetail cartDetail = cartDetailDao.getCartDetailByProductIdAndCartId(productId, cart.getId());
        if(cartDetail != null) {
            cartDetail.setQuantity(quantity);
            cartDetail.setSubTotal(plant.getUnitPrice() * quantity);
            cartDetailDao.updateCartDetailForCustomer(cartDetail);
            cartDao.updateCartTotalPrice(cart.getId());
        }
    }

    public void removePlantFromCart(Integer customerId, Integer productId) {
        Cart cart = cartDao.getCartByCustomerId(customerId);
        CartDetail cartDetail = cartDetailDao.getCartDetailByProductIdAndCartId(productId, cart.getId());
        if(cartDetail != null) {
            cartDetailDao.deleteCartDetail(cartDetail.getId());
            cartDao.updateCartTotalPrice(cart.getId());
        }
    }

    public Integer checkoutCart(Order order, CartDTO cart) {

        Integer orderId = orderService.addOrder(order);
        order.setId(orderId);

        for(CartDetailDTO cartDetailDTO : cart.getCartDetails()) {
            OrderDetail orderDetail = new OrderDetail();
            orderDetail.setProductId(cartDetailDTO.getProductId());
            orderDetail.setQuantity(cartDetailDTO.getQuantity());
            orderDetail.setSubtotal(cartDetailDTO.getSubTotal());
            orderDetail.setOrderId(order.getId());

            orderDetailService.addOrderDetails(orderDetail);
        }

        cartDetailDao.deleteCartDetailByCartId(cart.getId());
        cartDao.updateCartTotalPrice(cart.getId());
        return orderId;
    }

}
