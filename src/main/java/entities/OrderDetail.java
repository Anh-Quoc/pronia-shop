package entities;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class OrderDetail {
    private Integer id;
    private Integer productId;
    private Integer quantity;
    private Double subtotal;
    private Integer orderId;

    public OrderDetail() {
    }
}
