package daos;


import entities.Category;

import java.util.List;

public interface CategoryDaoInterface {

    Category getCategoryByID(int id);
    List<Category> getAllCategory();
//    List<CategoryDTO> getTop6CategoryHasPlant();
    List<Category> getCategoriesOfPlantByPlantID(int plantID);

    Category getCategoryByName(String name);

    void saveCategory(Category category);

    void saveCategoriesForPlant(Integer plantId, List<Category> categories);

    void updateCategory(Category category);

    void deleteCategory(int id);

    void deleteCategory(Category category);

}
