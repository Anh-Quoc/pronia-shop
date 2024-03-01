package entities;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class CartDetail {
    private Integer id;
    private Integer productId;
    private Integer quantity;
    private Integer cartId;
    private Double subTotal;

    public CartDetail() {
    }
}