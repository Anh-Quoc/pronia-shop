package dtos;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class CartDetailDTO {
    private Integer id;
    private Integer productId;
    private String productName;
    private String productImage;
    private Double productPrice;
    private Integer cartId;
    private Integer quantity;
    private Double subTotal;

    public CartDetailDTO() {
    }
}
