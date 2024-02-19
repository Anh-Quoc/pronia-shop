package daos;

import entities.PlantCategory;
import utils.DBContext;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class PlantCategoryDAO {
    private final String SELECT_CATEGORIES_OF_PLANT_BY_PLANT_ID = "SELECT * FROM plant_with_categories_view WHERE id = ?";

    private final String SELECT_TOP_6_CATEGORY_HAS_PLANT_STATEMENT = "SELECT TOP 6 category_name, COUNT(category_name) AS category_count FROM plant_with_categories_view " +
            "GROUP BY category_name " +
            "ORDER BY category_count DESC";

    private static PlantCategoryDAO instance;

    private PlantCategoryDAO (){

    }

    public static PlantCategoryDAO getInstance(){
        if(instance == null){
            instance = new PlantCategoryDAO();
        }
        return instance;
    }

    public Vector<String> getCategoriesOfPlantByID(int id){
        Vector<String> categories = new Vector<>();
        try(Connection connection = DBContext.getConnection()){
            PreparedStatement statement = connection.prepareStatement(SELECT_CATEGORIES_OF_PLANT_BY_PLANT_ID);
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()){
                String category = resultSet.getString("category_name");
                categories.add(category);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return categories;
    }

    public Vector<PlantCategory> getTop6CategoryHasPlant() {
        Vector<PlantCategory> plantCategories = new Vector<>();
        try(Connection connection = DBContext.getConnection()){
            PreparedStatement statement = connection.prepareStatement(SELECT_TOP_6_CATEGORY_HAS_PLANT_STATEMENT);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()){
                String category = resultSet.getString("category_name");
                int count = resultSet.getInt("category_count");
                plantCategories.add(new PlantCategory(category, count));
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return plantCategories;
    }
}
