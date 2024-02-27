package dtos;

import entities.Category;
import entities.Plant;
import entities.Tag;
import lombok.Data;

import java.sql.Date;
import java.util.List;

@Data
public class PlantDTO {
    private Integer id;
    private String title;
    private String description;
    private String imageLink;
    private String color;
    private double unitPrice;
    private List<TagDTO> plantTags;
    private List<CategoryDTO> plantCategories;
    private int quantity;
    private Date saleOpening;
    private String stockStatus;
    private boolean active;


    public void loadFromEntity(Plant plant, List<TagDTO> plantTags, List<CategoryDTO> plantCategories) {
        this.id = plant.getId();
        this.title = plant.getTitle();
        this.description = plant.getDescription();
        this.imageLink = plant.getImageLink();
        this.color = plant.getColor();
        this.unitPrice = plant.getUnitPrice();

        this.plantTags = plantTags;
        this.plantCategories = plantCategories;

        this.quantity = plant.getQuantity();
        this.saleOpening = plant.getSaleOpening();
        this.stockStatus = plant.getStockStatus();
        this.active = plant.isActive();
    }

}
