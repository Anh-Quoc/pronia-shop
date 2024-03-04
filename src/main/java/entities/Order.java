package entities;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class Order {
    private Integer id;
    private String country;
    private String streetAddress;
    private String apartment;
    private String city;
    private Double totalPrice;
    private java.sql.Date orderDate;
    private Integer orderStatusId;
    private Integer customerId;

    public Order() {
    }
}
