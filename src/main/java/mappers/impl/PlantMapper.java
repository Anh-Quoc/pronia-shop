package mappers.impl;

import dtos.PlantDTO;
import entities.Plant;
import mappers.DTOMapper;
import mappers.RowMapperInterface;

import java.sql.ResultSet;
import java.sql.SQLException;

public class PlantMapper implements RowMapperInterface<Plant>, DTOMapper<PlantDTO, Plant> {
    @Override
    public Plant mapRow(ResultSet resultSet) {
        Plant plant = new Plant();
        try {
            plant.setId(resultSet.getInt("id"));
            plant.setTitle(resultSet.getString("title"));
            plant.setDescription(resultSet.getString("description"));
            plant.setImageLink(resultSet.getString("image_link"));
            plant.setColor(resultSet.getString("color"));
            plant.setUnitPrice(resultSet.getDouble("unit_price"));
            plant.setQuantity(resultSet.getInt("quantity"));
            plant.setSaleOpening(resultSet.getDate("sale_opening"));
            plant.setStockStatus(resultSet.getString("stock_status"));
            plant.setActive(resultSet.getBoolean("active"));
        } catch (SQLException e) {
            return null;
        }
        return plant;
    }
}
