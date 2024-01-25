package daos;

import utils.DBContext;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class PlantTagDAO {

    private final String SELECT_TAG_OF_PLANT_BY_PLANT_ID = "SELECT * FROM plant_with_tags_view WHERE id = ?";

    private static PlantTagDAO instance;

    private PlantTagDAO(){

    }

    public static PlantTagDAO getInstance(){
        if(instance == null){
            instance = new PlantTagDAO();
        }
        return instance;
    }

    public Vector<String> getTagOfPlantByID(int id){
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



}
