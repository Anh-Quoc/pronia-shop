package daos;

import entities.Cart;

public interface CartDaoInterface {

    Cart getCartByCustomerId(Integer customerId);

}
