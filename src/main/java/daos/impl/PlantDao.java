package daos.impl;

import daos.PlantDaoInterface;
import entities.Plant;
import mappers.impl.PlantMapper;

import java.util.List;

public class PlantDao extends GenericDao<Plant> implements PlantDaoInterface {

    private final String SELECT_ALL_PLANT_STATEMENT = "SELECT * FROM plants";
    private final String SELECT_PLANT_BY_TITLE_STATEMENT = "SELECT * FROM plants WHERE plants.title LIKE ?";
    private final String SELECT_PLANT_BY_ID_STATEMENT = "SELECT * FROM plants WHERE plants.id = ?";
    private final String SELECT_PLANT_ORDER_BY_SALE_OPENING_STATEMENT = "SELECT TOP (?) * FROM plants ORDER BY plants.sale_opening DESC";
    private final String SELECT_BEST_SELLER_PLANT_STATEMENT = "SELECT TOP (?) * FROM plants ORDER BY plants.sale_opening";
    private final String SELECT_FEATURED_PLANT_STATEMENT = "SELECT TOP (?) * FROM plants ORDER BY plants.sale_opening";
    private final String INSERT_PLANT_STATEMENT = "INSERT INTO plants (title, description, image_link, color, unit_price, quantity, sale_opening, stock_status, active) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private final String UPDATE_PLANT_STATEMENT = "UPDATE plants SET title = ?, description = ?, image_link = ?, color = ?, unit_price = ?, quantity = ?, sale_opening = ?, stock_status = ?, active = ? WHERE id = ?";
    private final String DELETE_PLANT_STATEMENT = "UPDATE plants SET active = 0 WHERE id = ?";

    private static PlantDao instance = null;

    private PlantDao() {

    }

    public static PlantDao getInstance() {
        if (instance == null) {
            instance = new PlantDao();
        }
        return instance;
    }


    @Override
    public Plant getPlantById(int id) {
        List<Plant> result = executeQuery(SELECT_PLANT_BY_ID_STATEMENT, new PlantMapper(), id);
        return result.isEmpty() ? null : result.get(0);
    }

    @Override
    public Plant getActivePlantById(int id) {
        List<Plant> result = executeQuery(SELECT_PLANT_BY_ID_STATEMENT + " AND active = 1", new PlantMapper(), id);
        return result.isEmpty() ? null : result.get(0);
    }

    @Override
    public List<Plant> getAllPlant() {
        List<Plant> result = executeQuery(SELECT_ALL_PLANT_STATEMENT, new PlantMapper());
        return result;
    }

    public List<Plant> getAllActivePlant() {
        List<Plant> result = executeQuery(SELECT_ALL_PLANT_STATEMENT + " WHERE active = 1", new PlantMapper());
        return result;
    }

    @Override
    public List<Plant> getFeaturedPlant() {
        List<Plant> result = executeQuery(SELECT_FEATURED_PLANT_STATEMENT, new PlantMapper(), 4);
        return result;
    }

    @Override
    public List<Plant> getBestsellerPlant() {
        List<Plant> result = executeQuery(SELECT_BEST_SELLER_PLANT_STATEMENT, new PlantMapper(), 4);
        return result;
    }

    @Override
    public List<Plant> getLatestPlant() {
        List<Plant> result = executeQuery(SELECT_PLANT_ORDER_BY_SALE_OPENING_STATEMENT, new PlantMapper(), 4);
        return result;
    }

    @Override
    public List<Plant> getPlantByTitle(String title) {
        List<Plant> result = executeQuery(SELECT_PLANT_BY_TITLE_STATEMENT, new PlantMapper(), "%"+ title + "%");
        return result;
    }

    @Override
    public List<Plant> getRelatedPlant(int plantId) {
        return getFeaturedPlant();
    }

//    public List<Tag> getTagsOfPlant(int plantId) {
//        return null;
//    }

    @Override
    public Integer savePlant(Plant plant) {

        return executeUpdate(INSERT_PLANT_STATEMENT, plant.getTitle(), plant.getDescription(), plant.getImageLink(),
                plant.getColor(), plant.getUnitPrice(), plant.getQuantity(), plant.getSaleOpening(),
                plant.getStockStatus(), plant.isActive());
    }

    @Override
    public void updatePlant(Plant plant) {
        executeUpdate(UPDATE_PLANT_STATEMENT, plant.getTitle(), plant.getDescription(), plant.getImageLink(),
                plant.getColor(), plant.getUnitPrice(), plant.getQuantity(), plant.getSaleOpening(),
                plant.getStockStatus(), plant.isActive(), plant.getId());
    }

    @Override
    public void deletePlant(int id) {
        executeUpdate(DELETE_PLANT_STATEMENT, id);
    }

    @Override
    public void deletePlant(Plant plant) {
        deletePlant(plant.getId());
    }
}
