package dtos;

import entities.Tag;
import lombok.Data;

@Data
public class TagDTO {
    private Integer id;
    private String name;
    private boolean active;
    private Integer amount;

    public TagDTO() {
    }

    public TagDTO(Integer id, String name) {
        this.id = id;
        this.name = name;
    }

    public TagDTO(Integer id, String name, Integer amount) {
        this.id = id;
        this.name = name;
        this.amount = amount;
    }

    public TagDTO(String name) {
        this.name = name;
    }

    public void loadFromEntity(Tag tag) {
        if(tag != null) {
            if(tag.getId() != null) {
                this.id = tag.getId();
            }
            if(tag.getName() != null) {
                this.name = tag.getName();
            }
            this.active = tag.isActive();
        }


    }
}
