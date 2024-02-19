package entities;

import lombok.Data;

@Data
public class PlantCategory {
    private Integer id;

    private String name;

    private Integer amount;

    public PlantCategory() {
    }

    public PlantCategory(String name, Integer amount) {
        this.name = name;
        this.amount = amount;
    }

}
