package daos;

import entities.PlantTag;
import utils.DBContext;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class PlantTagDAO {

    private final String SELECT_TAG_OF_PLANT_BY_PLANT_ID_STATEMENT = "SELECT * FROM plant_with_tags_view WHERE id = ?";
    private final String SELECT_ALL_TAG_STATEMENT = "SELECT * FROM tag";
    private final String SELECT_TOP_6_TAG_HAS_PLANT_STATEMENT = "SELECT TOP 6 tag, COUNT(tag) AS tag_count FROM plant_with_tags_view " +
            "GROUP BY tag " +
            "ORDER BY tag_count DESC";
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
            PreparedStatement statement = connection.prepareStatement(SELECT_TAG_OF_PLANT_BY_PLANT_ID_STATEMENT);
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

    public Vector<PlantTag> getTop6TagHasPlant() {
        Vector<PlantTag> plantTags = new Vector<>();
        try(Connection connection = DBContext.getConnection()){
            PreparedStatement statement = connection.prepareStatement(SELECT_TOP_6_TAG_HAS_PLANT_STATEMENT);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()){
                String tag = resultSet.getString("tag");
                int count = resultSet.getInt("tag_count");
                plantTags.add(new PlantTag(tag, count));
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return plantTags;
    }
}
