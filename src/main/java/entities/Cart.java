package entities;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class Cart {
    private Integer id;
    private Integer customerId;
    private Double totalPrice;

    public Cart() {
    }
}
