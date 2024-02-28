package services;

import daos.impl.CategoryDao;
import entities.Category;

import java.util.List;
import java.util.stream.Collectors;

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

    public void saveCategoriesForPlant(Integer plantId, List<Category> categories) {

        List<Category> categoryEntities = categories.stream()
                .map(categoryDTO -> categoryDAO.getCategoryByName(categoryDTO.getName()))
                .collect(Collectors.toList());

        categoryDAO.saveCategoriesForPlant(plantId, categoryEntities);
    }

    public void updateCategoriesForPlant(Integer plantId, List<Category> categories) {
        List<Category> categoryEntities = categories.stream()
                .map(categoryDTO -> categoryDAO.getCategoryByName(categoryDTO.getName()))
                .collect(Collectors.toList());
        categoryDAO.updateCategoriesForPlant(plantId, categoryEntities);
    }

}
