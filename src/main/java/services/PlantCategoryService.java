package services;

import daos.impl.CategoryDao;
import entities.Category;

import java.util.List;

public class PlantCategoryService {
    private CategoryDao categoryDAO;
    private static PlantCategoryService instance;

    private PlantCategoryService() {
        categoryDAO = CategoryDao.getInstance();
    }

    public static PlantCategoryService getInstance() {
        if (instance == null) {
            instance = new PlantCategoryService();
        }
        return instance;
    }

    public List<Category> getAllPlantCategory() {
        return categoryDAO.getAllCategory();
    }

//    public List<CategoryDTO> getTop6CategoryHasPlant() {
//        return categoryDAO.getTop6CategoryHasPlant();
//    }

    public Category getCategoryByName(String name) {
        return categoryDAO.getCategoryByName(name);
    }

    public List<Category> getCategoriesByPlantId(int plantId) {
        return categoryDAO.getCategoriesOfPlantByPlantID(plantId);
    }
}
