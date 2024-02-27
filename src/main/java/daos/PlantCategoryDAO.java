//package daos;
//
//import jakarta.servlet.http.HttpServletRequest;
//import models.dtos.CategoryDTO;
//import utils.DBContext;
//
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.util.List;
//import java.util.Optional;
//import java.util.Vector;
//
//public class PlantCategoryDAO {
//
//    private static final String SELECT_ALL_CATEGORY_STATEMENT = "SELECT * FROM categories";
//
//    private final String SELECT_CATEGORIES_OF_PLANT_BY_PLANT_ID = "SELECT * FROM plant_with_categories_view WHERE id = ?";
//
//    private final String SELECT_TOP_6_CATEGORY_HAS_PLANT_STATEMENT = "SELECT TOP 6 category_name, COUNT(category_name) AS category_count FROM plant_with_categories_view " +
//            "GROUP BY category_name " +
//            "ORDER BY category_count DESC";
//    private final String SELECT_CATEGORY_ID_BY_NAME = "SELECT id FROM categories WHERE name = ?";
//
//    private final String SELECT_PLANT_CATEGORY_BY_NAME_STATEMENT = "SELECT * FROM categories WHERE name LIKE ?";
//
//    private static PlantCategoryDAO instance;
//
//    private PlantCategoryDAO (){
//
//    }
//
//    public static PlantCategoryDAO getInstance(){
//        if(instance == null){
//            instance = new PlantCategoryDAO();
//        }
//        return instance;
//    }
//
//    public List<CategoryDTO> getTop6CategoryHasPlant() {
//        List<CategoryDTO> plantCategories = new Vector<>();
//        try(Connection connection = DBContext.getConnection()){
//            PreparedStatement statement = connection.prepareStatement(SELECT_TOP_6_CATEGORY_HAS_PLANT_STATEMENT);
//            ResultSet resultSet = statement.executeQuery();
//
//            while (resultSet.next()){
//                String category = resultSet.getString("category_name");
//                int count = resultSet.getInt("category_count");
//                plantCategories.add(new CategoryDTO(category, count));
//            }
//
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//        return plantCategories;
//    }
//
//
//    public List<CategoryDTO> getCategoriesOfPlantByID(int plantID) {
//        Vector<PlantCategory> categories = new Vector<>();
//        try (Connection connection = DBContext.getConnection()) {
//            PreparedStatement statement = connection.prepareStatement(SELECT_CATEGORIES_OF_PLANT_BY_PLANT_ID);
//            statement.setInt(1, plantID);
//            ResultSet resultSet = statement.executeQuery();
//
//            while (resultSet.next()) {
//                Integer categoryID = resultSet.getInt("category_id");
//                String category = resultSet.getString("category_name");
//                categories.add(new PlantCategory(categoryID ,category));
//            }
//
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//        return categories;
//    }
//
//    public PlantCategory getCategoryByName(String name){
//        PlantCategory plantCategory = null;
//        try (Connection connection = DBContext.getConnection()) {
//            PreparedStatement statement = connection.prepareStatement(SELECT_CATEGORY_ID_BY_NAME);
//            statement.setString(1, name);
//            ResultSet resultSet = statement.executeQuery();
//            if (resultSet.next()) {
//                int id = resultSet.getInt("id");
//                plantCategory = new PlantCategory(id, name);
//            }
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//        return plantCategory;
//    }
//
//    public void createNewCategory(HttpServletRequest req) {
//        String name = req.getParameter("nameCategory");
//        try (Connection connection = DBContext.getConnection()) {
//            PreparedStatement statement = connection.prepareStatement("INSERT INTO categories(name) VALUES (?)");
//            statement.setString(1, name);
//            statement.executeUpdate();
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//    }
//
//    public void updateCategory(HttpServletRequest req) {
//        int id = Integer.parseInt(req.getParameter("categoryID"));
//        String name = req.getParameter("categoryName");
//        try (Connection connection = DBContext.getConnection()) {
//            PreparedStatement statement = connection.prepareStatement("UPDATE categories SET name = ? WHERE id = ?");
//            statement.setString(1, name);
//            statement.setInt(2, id);
//            statement.executeUpdate();
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//    }
//
//    public void deleteCategoryByID(int id) {
//
//    }
//
//    public Vector<PlantCategory> searchCategoryByName(String searchValue) {
//        Vector<PlantCategory> plantCategories = new Vector<>();
//        try (Connection connection = DBContext.getConnection()) {
//            PreparedStatement statement = connection.prepareStatement(SELECT_PLANT_CATEGORY_BY_NAME_STATEMENT);
//            statement.setString(1, "%" + searchValue + "%");
//            ResultSet resultSet = statement.executeQuery();
//            while (resultSet.next()) {
//                int id = resultSet.getInt("id");
//                String name = resultSet.getString("name");
//                plantCategories.add(new PlantCategory(id, name));
//            }
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//        return plantCategories;
//    }
//
//    @Override
//    public Optional<PlantCategory> get(int id) {
//        return Optional.empty();
//    }
//
//    @Override
//    public Vector<PlantCategory> getAll() {
//        Vector<PlantCategory> plantCategories = new Vector<>();
//        try (Connection connection = DBContext.getConnection()) {
//            PreparedStatement statement = connection.prepareStatement(SELECT_ALL_CATEGORY_STATEMENT);
//            ResultSet resultSet = statement.executeQuery();
//            while (resultSet.next()) {
//                int id = resultSet.getInt("id");
//                String name = resultSet.getString("name");
//                plantCategories.add(new PlantCategory(id, name));
//            }
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//        return plantCategories;
//    }
//
//    @Override
//    public void save(PlantCategory plantCategory) {
//
//    }
//
//    @Override
//    public void update(PlantCategory plantCategory) {
//
//    }
//
//    @Override
//    public void delete(PlantCategory plantCategory) {
//
//    }
//
//    @Override
//    public void deleteById(int id) {
//
//    }
//}
