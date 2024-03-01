package dtos;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.util.List;

@Data
@AllArgsConstructor
public class CartDTO {
    private Integer id;
    private Integer customerId;
    private Double totalPrice;

    private List<CartDetailDTO> cartDetails;

    public CartDTO() {
    }
}
