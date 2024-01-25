package daos;

import utils.DBContext;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class PlantCategoryDAO {
    private final String SELECT_CATEGORIES_OF_PLANT_BY_PLANT_ID = "SELECT * FROM plant_with_categories_view WHERE id = ?";

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
                String category = resultSet.getString("category");
                categories.add(category);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return categories;
    }
}
