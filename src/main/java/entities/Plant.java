package entities;

import java.util.Date;

public class Plant {
    private int id;
    private String title;
    private String description;
    private String imageLink;
    private String color;
    private double unitPrice;
    private String tag;
    private int quantity;
    private Date saleOpening;
    private String stockStatus;


    public Plant() {
    }

    public Plant(int id, String title, String description, String imageLink, String color, double unitPrice,
                 String tag, int quantity, Date saleOpening, String stockStatus) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.imageLink = imageLink;
        this.color = color;
        this.unitPrice = unitPrice;
        this.tag = tag;
        this.quantity = quantity;
        this.saleOpening = saleOpening;
        this.stockStatus = stockStatus;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImageLink() {
        return imageLink;
    }

    public void setImageLink(String imageLink) {
        this.imageLink = imageLink;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Date getSaleOpening() {
        return saleOpening;
    }

    public void setSaleOpening(Date saleOpening) {
        this.saleOpening = saleOpening;
    }

    public String getStockStatus() {
        return stockStatus;
    }

    public void setStockStatus(String stockStatus) {
        this.stockStatus = stockStatus;
    }
}
