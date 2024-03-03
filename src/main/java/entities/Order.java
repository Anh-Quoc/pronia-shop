package entities;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class Order {
    private Integer id;
    private String country; //
    private String streetAddress;//
    private String apartment;//
    private String city;//
    private String postcode;
    private Double totalPrice;//
    private java.sql.Date orderDate;//
    //    private List<OrderDetail> orderDetails;
    private Integer orderStatusId;
    private Integer customerId;//
//    private String customerName;
//    private String customerEmail;
//    private String customerPhone;

    public Order() {
    }
}
