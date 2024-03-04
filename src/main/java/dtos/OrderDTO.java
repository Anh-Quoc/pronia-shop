package dtos;

import entities.OrderDetail;
import entities.OrderStatus;
import lombok.AllArgsConstructor;
import lombok.Data;

import java.sql.Date;
import java.util.List;

@Data
@AllArgsConstructor
public class OrderDTO {
    private Integer id;
    private String country;
    private String streetAddress;
    private String apartment;
    private String city;
    private Double totalPrice;
    private Date orderDate;
    private List<OrderDetail> orderDetails;
    private OrderStatus orderStatus;
    private Integer customerId;
    private String customerName;
    private String customerEmail;
    private String customerPhone;

    public OrderDTO(){

    }

}
