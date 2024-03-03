package dtos;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class OrderDetailDTO {
    private Integer id;
    private Integer productId;
    private String productName;
    private Double unitPrice;
    private Integer quantity;
    private Double subtotal;
    private Integer orderId;

}
