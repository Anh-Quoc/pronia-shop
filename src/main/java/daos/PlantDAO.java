package daos;

import entities.Plant;
import utils.DBContext;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class PlantDAO {

    private static PlantDAO instance = null;

    private final String SELECT_ALL_PLANT_STATEMENT = "SELECT * FROM plants";
    private final String SELECT_PLANT_BY_TITLE_STATEMENT = "SELECT * FROM plants WHERE plants.title LIKE ?";
    private final String SELECT_PLANT_BY_ID_STATEMENT = "SELECT * FROM plants WHERE plants.id = ?";

    private final String SELECT_TAG_OF_PLANT_BY_PLANT_ID = "SELECT * FROM plant_with_tags_view WHERE id = ?";
    private final String SELECT_CATEGORIES_OF_PLANT_BY_PLANT_ID = "SELECT * FROM plant_with_categories_view WHERE id = ?";

    private PlantDAO() {

    }

    public static PlantDAO getInstance() {
        if (instance == null) {
            instance = new PlantDAO();
        }
        return instance;
    }

    public Vector<Plant> getAllPlant() {
        Vector<Plant> plants = new Vector<>();
        try(Connection connection = DBContext.getConnection()){
            PreparedStatement statement = connection.prepareStatement(SELECT_ALL_PLANT_STATEMENT);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()){
                Plant plant = new Plant();
                plant.setId(resultSet.getInt("id"));
                plant.setTitle(resultSet.getString("title"));
                plant.setDescription(resultSet.getString("description"));
                plant.setImageLink(resultSet.getString("image_link"));
                plant.setColor(resultSet.getString("color"));
                plant.setUnitPrice(resultSet.getFloat("unit_price"));

                plant.setPlantTags(getTagOfPlantByID(plant.getId()));
                plant.setPlantCategories(getCategoriesOfPlantByID(plant.getId()));

                plant.setQuantity(resultSet.getInt("quantity"));
                plant.setSaleOpening(resultSet.getDate("sale_opening"));
                plant.setStockStatus(resultSet.getString("stock_status"));

                plants.add(plant);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return plants;
    }

    public Vector<Plant> getFeaturedPlant() {
        return null;
    }

    public Vector<Plant> getBestsellerPlant() {
        return null;
    }

    public Vector<Plant> getLatestPlant() {
        return null;
    }

    public Vector<Plant> getNewPlants() {
        return null;
    }

    public Plant getPlantById(int id) {
        Plant plant = null;
        try(Connection connection = DBContext.getConnection()){
            PreparedStatement statement = connection.prepareStatement(SELECT_PLANT_BY_ID_STATEMENT);
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();

            if(resultSet.next()){
                plant = new Plant();
                plant.setId(resultSet.getInt("id"));
                plant.setTitle(resultSet.getString("title"));
                plant.setDescription(resultSet.getString("description"));
                plant.setImageLink(resultSet.getString("image_link"));
                plant.setColor(resultSet.getString("color"));
                plant.setUnitPrice(resultSet.getFloat("unit_price"));
                plant.setPlantTags(getTagOfPlantByID(plant.getId()));
                plant.setPlantCategories(getCategoriesOfPlantByID(plant.getId()));
                plant.setQuantity(resultSet.getInt("quantity"));
                plant.setSaleOpening(resultSet.getDate("sale_opening"));
                plant.setStockStatus(resultSet.getString("stock_status"));

            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return plant;
    }

    public Vector<Plant> getPlantByTitle(String productTitle) {
        Vector<Plant> plants = new Vector<>();
        try(Connection connection = DBContext.getConnection()){
            PreparedStatement statement = connection.prepareStatement(SELECT_PLANT_BY_TITLE_STATEMENT);
            statement.setString(1, "%" + productTitle + "%");
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()){
                Plant plant = new Plant();
                plant.setId(resultSet.getInt("id"));
                plant.setTitle(resultSet.getString("title"));
                plant.setDescription(resultSet.getString("description"));
                plant.setImageLink(resultSet.getString("image_link"));
                plant.setColor(resultSet.getString("color"));
                plant.setUnitPrice(resultSet.getFloat("unit_price"));

                plant.setPlantTags(getTagOfPlantByID(plant.getId()));
                plant.setPlantCategories(getCategoriesOfPlantByID(plant.getId()));

                plant.setQuantity(resultSet.getInt("quantity"));
                plant.setSaleOpening(resultSet.getDate("sale_opening"));
                plant.setStockStatus(resultSet.getString("stock_status"));

                plants.add(plant);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return plants;
    }

    private Vector<String> getTagOfPlantByID(int id){
        Vector<String> tags = new Vector<>();
        try(Connection connection = DBContext.getConnection()){
            PreparedStatement statement = connection.prepareStatement(SELECT_TAG_OF_PLANT_BY_PLANT_ID);
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()){
                String tag = resultSet.getString("tag");
                tags.add(tag);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return tags;
    }

    private Vector<String> getCategoriesOfPlantByID(int id){
        Vector<String> categories = new Vector<>();
        try(Connection connection = DBContext.getConnection()){
            PreparedStatement statement = connection.prepareStatement(SELECT_CATEGORIES_OF_PLANT_BY_PLANT_ID);
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()){
                String category = resultSet.getString("category");
                categories.add(category);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return categories;
    }

}
