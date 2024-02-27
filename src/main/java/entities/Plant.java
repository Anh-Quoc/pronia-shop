package entities;

import dtos.PlantDTO;
import lombok.Data;

import java.sql.Date;

@Data
public class Plant {
    private Integer id;
    private String title;
    private String description;
    private String imageLink;
    private String color;
    private double unitPrice;
    private int quantity;
    private Date saleOpening;
    private String stockStatus;
    private boolean active;

    public Plant(){

    }

    public Plant(int id, String title, String description, String imageLink, String color, double unitPrice,
                 int quantity, Date saleOpening, String stockStatus) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.imageLink = imageLink;
        this.color = color;
        this.unitPrice = unitPrice;
        this.quantity = quantity;
        this.saleOpening = saleOpening;
        this.stockStatus = stockStatus;
    }

    public Plant(String title, String description, String imageLink, String color, double unitPrice,
                 int quantity, Date saleOpening, String stockStatus) {
        this.title = title;
        this.description = description;
        this.imageLink = imageLink;
        this.color = color;
        this.unitPrice = unitPrice;
        this.quantity = quantity;
        this.saleOpening = saleOpening;
        this.stockStatus = stockStatus;
    }

    public void loadFromDTO(PlantDTO plantDTO) {
        this.id = plantDTO.getId();
        this.title = plantDTO.getTitle();
        this.description = plantDTO.getDescription();
        this.imageLink = plantDTO.getImageLink();
        this.color = plantDTO.getColor();
        this.unitPrice = plantDTO.getUnitPrice();
        this.quantity = plantDTO.getQuantity();
        this.saleOpening = plantDTO.getSaleOpening();
        this.stockStatus = plantDTO.getStockStatus();
        this.active = plantDTO.isActive();
    }
}
