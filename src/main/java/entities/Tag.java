package entities;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class Tag {
    private Integer id;
    private String name;
    public Tag() {

    }
}
