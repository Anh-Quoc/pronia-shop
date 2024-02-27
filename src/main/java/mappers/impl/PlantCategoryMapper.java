package mappers.impl;

import entities.Category;
import mappers.RowMapperInterface;

public class PlantCategoryMapper implements RowMapperInterface<Category> {
    @Override
    public Category mapRow(java.sql.ResultSet rs) {
        Category category = new Category();
        try {
            category.setId(rs.getInt("category_id"));
            category.setName(rs.getString("category_name"));
            return category;
        } catch (Exception e) {
            return null;
        }
    }
}
