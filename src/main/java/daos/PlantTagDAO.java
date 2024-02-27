//package daos;
//
//import models.PlantTag;
//import utils.DBContext;
//
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.util.Optional;
//import java.util.Vector;
//
//public class PlantTagDAO implements BaseDAO<PlantTag>{
//
//    private final String SELECT_TAG_OF_PLANT_BY_PLANT_ID_STATEMENT = "SELECT * FROM plant_with_tags_view WHERE id = ?";
//    private final String SELECT_ALL_TAG_STATEMENT = "SELECT * FROM tags";
//
//    private final String SELECT_TAG_ID_BY_NAME = "SELECT id FROM tags WHERE name = ?";
//
//    private final String SELECT_TOP_6_TAG_HAS_PLANT_STATEMENT = "SELECT TOP 6 tag_name, COUNT(tag_name) AS tag_count FROM plant_with_tags_view " +
//            "GROUP BY tag_name " +
//            "ORDER BY tag_count DESC";
//    private static PlantTagDAO instance;
//
//    private PlantTagDAO(){
//
//    }
//
//    public static PlantTagDAO getInstance(){
//        if(instance == null){
//            instance = new PlantTagDAO();
//        }
//        return instance;
//    }
//
//    public Vector<PlantTag> getTagOfPlantByPlantID(int id){
//        Vector<PlantTag> tags = new Vector<>();
//        try(Connection connection = DBContext.getConnection()){
//            PreparedStatement statement = connection.prepareStatement(SELECT_TAG_OF_PLANT_BY_PLANT_ID_STATEMENT);
//            statement.setInt(1, id);
//            ResultSet resultSet = statement.executeQuery();
//
//            while (resultSet.next()){
//                PlantTag tag = new PlantTag(resultSet.getString("tag_name"));
//                tags.add(tag);
//            }
//
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//        return tags;
//    }
//
//    public Vector<PlantTag> getTop6TagHasPlant() {
//        Vector<PlantTag> plantTags = new Vector<>();
//        try(Connection connection = DBContext.getConnection()){
//            PreparedStatement statement = connection.prepareStatement(SELECT_TOP_6_TAG_HAS_PLANT_STATEMENT);
//            ResultSet resultSet = statement.executeQuery();
//
//            while (resultSet.next()){
//                String tag = resultSet.getString("tag_name");
//                int count = resultSet.getInt("tag_count");
//                plantTags.add(new PlantTag(tag, count));
//            }
//
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//        return plantTags;
//    }
//
//    @Override
//    public Optional<PlantTag> get(int id) {
//        return Optional.empty();
//    }
//
//    public PlantTag getTagByName(String tagName) {
//        PlantTag tag = null;
//        try(Connection connection = DBContext.getConnection()){
//            PreparedStatement statement = connection.prepareStatement(SELECT_TAG_ID_BY_NAME);
//            statement.setString(1, tagName);
//            ResultSet resultSet = statement.executeQuery();
//
//            if (resultSet.next()){
//                Integer tagID = resultSet.getInt("id");
//                tag = new PlantTag(tagID, tagName);
//            }
//
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//        return tag;
//
//    }
//
//    @Override
//    public Vector<PlantTag> getAll() {
//        Vector<PlantTag> plantTags = new Vector<>();
//        try (Connection connection = DBContext.getConnection()){
//            PreparedStatement statement = connection.prepareStatement(SELECT_ALL_TAG_STATEMENT);
//            ResultSet resultSet = statement.executeQuery();
//            while (resultSet.next()){
//                int id = resultSet.getInt("id");
//                String name = resultSet.getString("name");
//                plantTags.add(new PlantTag(id, name));
//            }
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//        return plantTags;
//    }
//
//    @Override
//    public void save(PlantTag plantTag) {
//
//    }
//
//    @Override
//    public void update(PlantTag plantTag) {
//
//    }
//
//    @Override
//    public void delete(PlantTag plantTag) {
//
//    }
//
//    @Override
//    public void deleteById(int id) {
//
//    }
//}
