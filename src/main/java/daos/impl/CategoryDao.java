package daos.impl;

import daos.CategoryDaoInterface;
import mappers.impl.CategoryMapper;
import dtos.CategoryDTO;
import entities.Category;
import mappers.impl.PlantCategoryMapper;

import java.util.List;

public class CategoryDao extends GenericDao<Category> implements CategoryDaoInterface {

    private static final String SELECT_ALL_CATEGORY_STATEMENT = "SELECT * FROM categories";

    private final String SELECT_CATEGORIES_OF_PLANT_BY_PLANT_ID = "SELECT * FROM plant_with_categories_view WHERE id = ?";

    private final String SELECT_TOP_6_CATEGORY_HAS_PLANT_STATEMENT = "SELECT TOP 6 category_name, COUNT(category_name) AS category_count FROM plant_with_categories_view " +
            "GROUP BY category_name " +
            "ORDER BY category_count DESC";
    private final String SELECT_CATEGORY_ID_BY_NAME = "SELECT id FROM categories WHERE name = ?";

    private final String SELECT_PLANT_CATEGORY_BY_NAME_STATEMENT = "SELECT * FROM categories WHERE name LIKE ?";

    private final String INSERT_CATEGORY_STATEMENT = "INSERT INTO categories(name) VALUES(?)";

    private final String INSERT_PLANT_CATEGORY_STATEMENT = "INSERT INTO plant_categories(plant_id, category_id) VALUES (?, ?)";


    private final String UPDATE_CATEGORY_STATEMENT = "UPDATE categories SET name = ? WHERE id = ?";

    private static CategoryDao instance;

    private CategoryDao (){

    }

    public static CategoryDao getInstance(){
        if(instance == null){
            instance = new CategoryDao();
        }
        return instance;
    }


    @Override
    public Category getCategoryByID(int id) {
        return null;
    }

    @Override
    public List<Category> getAllCategory() {

        List<Category> categories = executeQuery(SELECT_ALL_CATEGORY_STATEMENT, new CategoryMapper());
        return categories;
    }

//    @Override
//    public List<Category> getTop6CategoryHasPlant() {
//
//        List<Category> categories = executeQuery(SELECT_TOP_6_CATEGORY_HAS_PLANT_STATEMENT, new CategoryMapper());
//        return categories;
//    }

    @Override
    public List<Category> getCategoriesOfPlantByPlantID(int plantID) {
        List<Category> categories = executeQuery(SELECT_CATEGORIES_OF_PLANT_BY_PLANT_ID, new PlantCategoryMapper(), plantID);
        return categories;
    }

    @Override
    public Category getCategoryByName(String name) {
        List<Category> categories = executeQuery(SELECT_PLANT_CATEGORY_BY_NAME_STATEMENT, new CategoryMapper(), name);
        if(categories.isEmpty()){
            return null;
        }
        return categories.get(0);
    }

    @Override
    public void saveCategory(Category category) {
        executeUpdate(INSERT_CATEGORY_STATEMENT, category.getName());
    }

    @Override
    public void saveCategoriesForPlant(Integer plantId, List<Category> categories) {
        for (Category category : categories) {
            executeUpdate(INSERT_PLANT_CATEGORY_STATEMENT, plantId, category.getId());
        }
    }

    @Override
    public void updateCategory(Category category) {
        executeUpdate(UPDATE_CATEGORY_STATEMENT, category.getName(), category.getId());
    }

    @Override
    public void deleteCategory(int id) {

    }

    @Override
    public void deleteCategory(Category category) {

    }
}
