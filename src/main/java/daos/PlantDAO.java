//package daos;
//
//import entities.Plant;
//import models.PlantCategory;
//import models.PlantTag;
//import utils.Constants;
//import utils.DBContext;
//
//import java.sql.*;
//import java.util.Optional;
//import java.util.Vector;
//
//public class PlantDAO implements BaseDAO<Plant> {
//
//    private PlantTagDAO plantTagDAO;
//    private PlantCategoryDAO plantCategoryDAO;
//
//
//    private static PlantDAO instance = null;
//
//    private PlantDAO() {
//        plantTagDAO = PlantTagDAO.getInstance();
//        plantCategoryDAO = PlantCategoryDAO.getInstance();
//    }
//
//    public static PlantDAO getInstance() {
//        if (instance == null) {
//            instance = new PlantDAO();
//        }
//        return instance;
//    }
//
//
//    public Vector<Plant> getFeaturedPlant() {
//        Vector<Plant> plants = new Vector<>();
//        try (Connection connection = DBContext.getConnection()) {
//            PreparedStatement statement = connection.prepareStatement(SELECT_FEATURED_PLANT_STATEMENT);
//            statement.setInt(1, Constants.NUMBER_OF_FEATURED_PLANT);
//            ResultSet resultSet = statement.executeQuery();
//
//            while (resultSet.next()) {
//                Plant plant = new Plant();
//                plant.setId(resultSet.getInt("id"));
//                plant.setTitle(resultSet.getString("title"));
//                plant.setDescription(resultSet.getString("description"));
//                plant.setImageLink(resultSet.getString("image_link"));
//                plant.setColor(resultSet.getString("color"));
//                plant.setUnitPrice(resultSet.getDouble("unit_price"));
//
////                plant.setPlantTags(plantTagDAO.getTagOfPlantByID(plant.getId()));
////                plant.setPlantCategories(plantCategoryDAO.getCategoriesOfPlantByID(plant.getId()));
//
//                plant.setQuantity(resultSet.getInt("quantity"));
//                plant.setSaleOpening(resultSet.getDate("sale_opening"));
//                plant.setStockStatus(resultSet.getString("stock_status"));
//
//                plants.add(plant);
//            }
//
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//        return plants;
//    }
//
//    public Vector<Plant> getBestsellerPlant() {
//        Vector<Plant> plants = new Vector<>();
//        try (Connection connection = DBContext.getConnection()) {
//            PreparedStatement statement = connection.prepareStatement(SELECT_BEST_SELLER_PLANT_STATEMENT);
//            statement.setInt(1, Constants.NUMBER_OF_BESTSELLER_PLANT);
//            ResultSet resultSet = statement.executeQuery();
//
//            while (resultSet.next()) {
//                Plant plant = new Plant();
//                plant.setId(resultSet.getInt("id"));
//                plant.setTitle(resultSet.getString("title"));
//                plant.setDescription(resultSet.getString("description"));
//                plant.setImageLink(resultSet.getString("image_link"));
//                plant.setColor(resultSet.getString("color"));
//                plant.setUnitPrice(resultSet.getDouble("unit_price"));
//
////                plant.setPlantTags(plantTagDAO.getTagOfPlantByID(plant.getId()));
////                plant.setPlantCategories(plantCategoryDAO.getCategoriesOfPlantByID(plant.getId()));
//
//                plant.setQuantity(resultSet.getInt("quantity"));
//                plant.setSaleOpening(resultSet.getDate("sale_opening"));
//                plant.setStockStatus(resultSet.getString("stock_status"));
//
//                plants.add(plant);
//            }
//
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//        return plants;
//    }
//
//    public Vector<Plant> getLatestPlant() {
//        Vector<Plant> plants = new Vector<>();
//        try (Connection connection = DBContext.getConnection()) {
//            PreparedStatement statement = connection.prepareStatement(SELECT_PLANT_ORDER_BY_SALE_OPENING_STATEMENT);
//            statement.setInt(1, Constants.NUMBER_OF_LATEST_PLANT);
//            ResultSet resultSet = statement.executeQuery();
//
//            while (resultSet.next()) {
//                Plant plant = new Plant();
//                plant.setId(resultSet.getInt("id"));
//                plant.setTitle(resultSet.getString("title"));
//                plant.setDescription(resultSet.getString("description"));
//                plant.setImageLink(resultSet.getString("image_link"));
//                plant.setColor(resultSet.getString("color"));
//                plant.setUnitPrice(resultSet.getDouble("unit_price"));
//
////                plant.setPlantTags(plantTagDAO.getTagOfPlantByID(plant.getId()));
////                plant.setPlantCategories(plantCategoryDAO.getCategoriesOfPlantByID(plant.getId()));
//
//                plant.setQuantity(resultSet.getInt("quantity"));
//                plant.setSaleOpening(resultSet.getDate("sale_opening"));
//                plant.setStockStatus(resultSet.getString("stock_status"));
//
//                plants.add(plant);
//            }
//
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//        return plants;
//    }
//
//    public Vector<Plant> getPlantByTitle(String productTitle) {
//        Vector<Plant> plants = new Vector<>();
//        try (Connection connection = DBContext.getConnection()) {
//            PreparedStatement statement = connection.prepareStatement(SELECT_PLANT_BY_TITLE_STATEMENT);
//            statement.setString(1, "%" + productTitle + "%");
//            ResultSet resultSet = statement.executeQuery();
//
//            while (resultSet.next()) {
//                Plant plant = new Plant();
//                plant.setId(resultSet.getInt("id"));
//                plant.setTitle(resultSet.getString("title"));
//                plant.setDescription(resultSet.getString("description"));
//                plant.setImageLink(resultSet.getString("image_link"));
//                plant.setColor(resultSet.getString("color"));
//                plant.setUnitPrice(resultSet.getDouble("unit_price"));
//
//                plant.setPlantTags(plantTagDAO.getTagOfPlantByPlantID(plant.getId()));
//                plant.setPlantCategories(plantCategoryDAO.getCategoriesOfPlantByID(plant.getId()));
//
//                plant.setQuantity(resultSet.getInt("quantity"));
//                plant.setSaleOpening(resultSet.getDate("sale_opening"));
//                plant.setStockStatus(resultSet.getString("stock_status"));
//
//                plants.add(plant);
//            }
//
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//        return plants;
//    }
//
//    public Vector<Plant> getRelatedPlant(int id) {
//        return getFeaturedPlant();
//    }
//
//    @Override
//    public Optional<Plant> get(int id) {
//        Plant plant = null;
//        try (Connection connection = DBContext.getConnection()) {
//            PreparedStatement statement = connection.prepareStatement(SELECT_PLANT_BY_ID_STATEMENT);
//            statement.setInt(1, id);
//            ResultSet resultSet = statement.executeQuery();
//
//            if (resultSet.next()) {
//                plant = new Plant();
//                plant.setId(resultSet.getInt("id"));
//                plant.setTitle(resultSet.getString("title"));
//                plant.setDescription(resultSet.getString("description"));
//                plant.setImageLink(resultSet.getString("image_link"));
//                plant.setColor(resultSet.getString("color"));
//                plant.setUnitPrice(resultSet.getDouble("unit_price"));
//                plant.setPlantTags(plantTagDAO.getTagOfPlantByPlantID(plant.getId()));
//                plant.setPlantCategories(plantCategoryDAO.getCategoriesOfPlantByID(plant.getId()));
//                plant.setQuantity(resultSet.getInt("quantity"));
//                plant.setSaleOpening(resultSet.getDate("sale_opening"));
//                plant.setStockStatus(resultSet.getString("stock_status"));
//
//            }
//
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//
//        return Optional.ofNullable(plant);
//    }
//
//    @Override
//    public Vector<Plant> getAll() {
//        Vector<Plant> plants = new Vector<>();
//        try (Connection connection = DBContext.getConnection()) {
//            PreparedStatement statement = connection.prepareStatement(SELECT_ALL_PLANT_STATEMENT);
//            ResultSet resultSet = statement.executeQuery();
//
//            while (resultSet.next()) {
//                Plant plant = new Plant();
//                plant.setId(resultSet.getInt("id"));
//                plant.setTitle(resultSet.getString("title"));
//                plant.setDescription(resultSet.getString("description"));
//                plant.setImageLink(resultSet.getString("image_link"));
//                plant.setColor(resultSet.getString("color"));
//                plant.setUnitPrice(resultSet.getDouble("unit_price"));
//
//                plant.setPlantTags(plantTagDAO.getTagOfPlantByPlantID(plant.getId()));
//                plant.setPlantCategories(plantCategoryDAO.getCategoriesOfPlantByID(plant.getId()));
//
//                plant.setQuantity(resultSet.getInt("quantity"));
//                plant.setSaleOpening(resultSet.getDate("sale_opening"));
//                plant.setStockStatus(resultSet.getString("stock_status"));
//                plant.setActive(resultSet.getBoolean("active"));
//                plants.add(plant);
//            }
//
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//        return plants;
//    }
//
//    @Override
//    public void save(Plant plant) {
//        try (Connection connection = DBContext.getConnection()) {
//            PreparedStatement statement = connection.prepareStatement(INSERT_PLANT_STATEMENT, Statement.RETURN_GENERATED_KEYS);
//
//            statement.setString(1, plant.getTitle());
//            statement.setString(2, plant.getDescription());
//            statement.setString(3, plant.getImageLink());
//            statement.setString(4, plant.getColor());
//            statement.setDouble(5, plant.getUnitPrice());
//            statement.setInt(6, plant.getQuantity());
//            statement.setDate(7, plant.getSaleOpening());
//            statement.setString(8, plant.getStockStatus());
//            statement.setBoolean(9, true);
//            statement.executeUpdate();
//
//            ResultSet resultSet = statement.getGeneratedKeys();
//            if (resultSet.next()) {
//                plant.setId(resultSet.getInt(1));
//            }
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//        savePlantCategories(plant);
//        savePlantTags(plant);
//    }
//
//    private void savePlantTags(Plant plant) {
//        final String INSERT_PLANT_TAG_STATEMENT = "INSERT INTO plant_tags(plant_id, tag_id) VALUES (?, ?)";
//        try (Connection connection = DBContext.getConnection()) {
//            PreparedStatement statement = connection.prepareStatement(INSERT_PLANT_TAG_STATEMENT);
//            for (PlantTag plantTag : plant.getPlantTags()) {
//                statement.setInt(1, plant.getId());
//                statement.setInt(2, plantTag.getId());
//                statement.addBatch();
//            }
//            statement.executeBatch();
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//    }
//
//    private void savePlantCategories(Plant plant) {
//        final String INSERT_PLANT_CATEGORY_STATEMENT = "INSERT INTO plant_categories(plant_id, category_id) VALUES (?, ?)";
//        try (Connection connection = DBContext.getConnection()) {
//            PreparedStatement statement = connection.prepareStatement(INSERT_PLANT_CATEGORY_STATEMENT);
//            for (PlantCategory plantCategory : plant.getPlantCategories()) {
//                statement.setInt(1, plant.getId());
//                statement.setInt(2, plantCategory.getId());
//                statement.addBatch();
//            }
//            statement.executeBatch();
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//    }
//
//    @Override
//    public void update(Plant newPlant) {
//        final String UPDATE_PLANT_STATEMENT = "UPDATE plants SET title = ?, description = ?, image_link = ?, color = ?, unit_price = ?, quantity = ?, sale_opening = ?, stock_status = ?, active = ? WHERE id = ?";
//        try (Connection connection = DBContext.getConnection()) {
//            PreparedStatement statement = connection.prepareStatement(UPDATE_PLANT_STATEMENT);
//            statement.setString(1, newPlant.getTitle());
//            statement.setString(2, newPlant.getDescription());
//            statement.setString(3, newPlant.getImageLink());
//            statement.setString(4, newPlant.getColor());
//            statement.setDouble(5, newPlant.getUnitPrice());
//            statement.setInt(6, newPlant.getQuantity());
//            statement.setDate(7, newPlant.getSaleOpening());
//            statement.setString(8, newPlant.getStockStatus());
//            statement.setBoolean(9, newPlant.isActive());
//            statement.setInt(10, newPlant.getId());
//            statement.executeUpdate();
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//        updatePlantCategories(newPlant);
//        updatePlantTags(newPlant);
//    }
//
//    private void updatePlantTags(Plant newPlant) {
//        final String DELETE_PLANT_TAG_STATEMENT = "DELETE FROM plant_tags WHERE plant_id = ?";
//        try (Connection connection = DBContext.getConnection()) {
//            PreparedStatement statement = connection.prepareStatement(DELETE_PLANT_TAG_STATEMENT);
//            statement.setInt(1, newPlant.getId());
//            statement.executeUpdate();
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//        savePlantTags(newPlant);
//    }
//
//    private void updatePlantCategories(Plant newPlant) {
//        final String DELETE_PLANT_CATEGORY_STATEMENT = "DELETE FROM plant_categories WHERE plant_id = ?";
//        try (Connection connection = DBContext.getConnection()) {
//            PreparedStatement statement = connection.prepareStatement(DELETE_PLANT_CATEGORY_STATEMENT);
//            statement.setInt(1, newPlant.getId());
//            statement.executeUpdate();
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//        savePlantCategories(newPlant);
//    }
//
//    @Override
//    public void delete(Plant plant) {
//
//    }
//
//    @Override
//    public void deleteById(int id) {
//        try (Connection connection = DBContext.getConnection()){
//            PreparedStatement statement = connection.prepareStatement(DELETE_PLANT_STATEMENT);
//            statement.setInt(1, id);
//            statement.executeUpdate();
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//    }
//}
