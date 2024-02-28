package dtos;

import entities.Category;
import lombok.Data;

@Data
public class CategoryDTO {
    private Integer id;
    private String name;
    private boolean active;
    private Integer amount;

    public CategoryDTO() {
    }

    public CategoryDTO(Integer id, String name, Integer amount) {
        this.id = id;
        this.name = name;
        this.amount = amount;
    }

    public CategoryDTO(Integer id, String name) {
        this.id = id;
        this.name = name;
    }

    public CategoryDTO(String name) {
        this.name = name;
    }

    public void loadFromEntity(Category category) {

        if(category != null){
            if(category.getId() != null){
                this.id = category.getId();
            }
            if(category.getName() != null){
                this.name = category.getName();
            }
            this.active = category.isActive();
        }
    }


}
