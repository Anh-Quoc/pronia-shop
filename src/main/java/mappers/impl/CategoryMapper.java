package mappers.impl;

import dtos.CategoryDTO;
import entities.Category;
import mappers.DTOMapper;
import mappers.RowMapperInterface;

import java.sql.ResultSet;

public class CategoryMapper implements RowMapperInterface<Category>, DTOMapper<CategoryDTO, Category> {
    @Override
    public Category mapRow(ResultSet rs) {
        Category category = new Category();
        try {
            category.setId(rs.getInt("id"));
            category.setName(rs.getString("name"));
            category.setActive(rs.getBoolean("active"));
        } catch (Exception e) {
            return null;
        }
        return category;
    }

}
