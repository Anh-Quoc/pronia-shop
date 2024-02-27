package services;


import daos.impl.PlantDao;

import dtos.CategoryDTO;
import dtos.TagDTO;
import entities.Category;
import entities.Plant;
import dtos.PlantDTO;
import entities.Tag;

import java.util.List;
import java.util.Vector;
import java.util.stream.Collectors;

public class PlantService {

    private PlantTagService plantTagService;
    private PlantCategoryService plantCategoryService;
    private PlantDao plantDAO;
    private static PlantService instance;

    private PlantService() {
        plantDAO = PlantDao.getInstance();
        plantTagService = PlantTagService.getInstance();
        plantCategoryService = PlantCategoryService.getInstance();
    }

    public static PlantService getInstance() {
        if (instance == null) {
            instance = new PlantService();
        }
        return instance;
    }

    public List<PlantDTO> getAllPlant() {
        List<PlantDTO> plants = new Vector<>();
        List<Plant> listPlantEntity = plantDAO.getAllPlant();

        listPlantEntity.forEach(plant -> {
            PlantDTO plantDTO = new PlantDTO();

            List<TagDTO> tags = plantTagService.getTagsByPlantId(plant.getId()).stream().map(tag -> {
                TagDTO tagDTO = new TagDTO();
                tagDTO.loadFromEntity(tag);
                return tagDTO;
            }).collect(Collectors.toList());


            List<CategoryDTO> categories = plantCategoryService.getCategoriesByPlantId(plant.getId()).stream().map(category -> {
                CategoryDTO categoryDTO = new CategoryDTO();
                categoryDTO.loadFromEntity(category);
                return categoryDTO;
            }).collect(Collectors.toList());

            plantDTO.loadFromEntity(plant, tags, categories);

            plants.add(plantDTO);
        });

        return plants;
    }

    public PlantDTO getPlantById(int id) {
        Plant plant = plantDAO.getPlantById(id);

        PlantDTO plantDTO = new PlantDTO();

        List<TagDTO> tags = plantTagService.getTagsByPlantId(plant.getId()).stream().map(tag -> {
            TagDTO tagDTO = new TagDTO();
            tagDTO.loadFromEntity(tag);
            return tagDTO;
        }).collect(Collectors.toList());


        List<CategoryDTO> categories = plantCategoryService.getCategoriesByPlantId(plant.getId()).stream().map(category -> {
            CategoryDTO categoryDTO = new CategoryDTO();
            categoryDTO.loadFromEntity(category);
            return categoryDTO;
        }).collect(Collectors.toList());

        plantDTO.loadFromEntity(plant, tags, categories);
        return plantDTO;
    }

    public List<Plant> getFeaturedPlants() {
        List<Plant> plants = plantDAO.getFeaturedPlant();
        return plants;
    }

    public List<Plant> getBestsellerPlants() {
        List<Plant> plants = plantDAO.getBestsellerPlant();
        return plants;
    }

    public List<Plant> getLatestPlants() {
        List<Plant> plants = plantDAO.getLatestPlant();
        return plants;
    }

    public List<PlantDTO> getRelatedPlant(int id) {
        List<PlantDTO> listPlant = new Vector<>();
        List<Plant> plants = plantDAO.getRelatedPlant(id);

        plants.forEach(plant -> {
            PlantDTO plantDTO = new PlantDTO();

            List<TagDTO> tags = plantTagService.getTagsByPlantId(plant.getId()).stream().map(tag -> {
                TagDTO tagDTO = new TagDTO();
                tagDTO.loadFromEntity(tag);
                return tagDTO;
            }).collect(Collectors.toList());


            List<CategoryDTO> categories = plantCategoryService.getCategoriesByPlantId(plant.getId()).stream().map(category -> {
                CategoryDTO categoryDTO = new CategoryDTO();
                categoryDTO.loadFromEntity(category);
                return categoryDTO;
            }).collect(Collectors.toList());

            plantDTO.loadFromEntity(plant, tags, categories);
            listPlant.add(plantDTO);
        });
        return listPlant;
    }

//    public List<Category> getTop6CategoryHasPlant() {
//        List<Category> plantCategories = plantCategoryService.getTop6CategoryHasPlant();
//        return plantCategories;
//    }

    public void createNewPlant(PlantDTO plantDTO) {
        Plant newPlant = new Plant();
        List<Tag> tags = plantDTO.getPlantTags().stream().map(tagDTO -> {
            Tag tag = new Tag();
            tag.setId(tagDTO.getId());
            tag.setName(tagDTO.getName());
            return tag;
        }).collect(Collectors.toList());

        List<Category> plantCategories = plantDTO.getPlantCategories().stream().map(categoryDTO -> {
            Category category = new Category();
            category.setId(categoryDTO.getId());
            category.setName(categoryDTO.getName());
            return category;
        }).collect(Collectors.toList());

        newPlant.setTitle(plantDTO.getTitle());
        newPlant.setDescription(plantDTO.getDescription());
        newPlant.setImageLink(plantDTO.getImageLink());
        newPlant.setColor(plantDTO.getColor());
        newPlant.setUnitPrice(plantDTO.getUnitPrice());
        newPlant.setQuantity(plantDTO.getQuantity());
        newPlant.setSaleOpening(plantDTO.getSaleOpening());
        newPlant.setStockStatus(plantDTO.getStockStatus());
        newPlant.setActive(plantDTO.isActive());


        // Save new plant to database
        Integer plantId = plantDAO.savePlant(newPlant);
        plantTagService.saveTagsForPlant(plantId, tags);
        plantCategoryService.saveCategoriesForPlant(plantId, plantCategories);
    }
//
//    public void updatePlant(HttpServletRequest req) {
//        // Update plant
//        Plant newPlant = new Plant();
//        newPlant.setId(Integer.parseInt(req.getParameter("plantID")));
//        newPlant.setTitle(req.getParameter("title"));
//        newPlant.setDescription(req.getParameter("description"));
//        newPlant.setImageLink(req.getParameter("imageLink"));
//        newPlant.setColor(req.getParameter("color"));
//        newPlant.setUnitPrice(Double.parseDouble(req.getParameter("unitPrice")));
//
//        Vector<PlantCategory> plantCategories = new Vector<>();
//        for(String category : req.getParameterValues("plantCategories[]")){
//            PlantCategory plantCategory = plantCategoryService.getCategoryByName(category);
//            if(plantCategory != null){
//                plantCategories.add(plantCategory);
//            }
//        }
//
//        Vector<PlantTag> plantTags = new Vector<>();
//        for(String tag : req.getParameterValues("plantTags[]")){
//            PlantTag plantTag = plantTagService.getTagByName(tag);
//            if(plantTag != null){
//                plantTags.add(plantTag);
//            }
//        }
//        newPlant.setPlantTags(plantTags);
//        newPlant.setPlantCategories(plantCategories);
//
//        newPlant.setQuantity(Integer.parseInt(req.getParameter("quantity")));
//        newPlant.setSaleOpening(Date.valueOf(req.getParameter("saleOpening")));
//
//        newPlant.setStockStatus(req.getParameter("stockStatus"));
//        newPlant.setActive(Boolean.parseBoolean(req.getParameter("isActive")));
//
//        // Save new plant to database
//        plantDAO.update(newPlant);
//    }

    public void deletePlantByID(int id) {
        plantDAO.deletePlant(id);
    }

    public List<PlantDTO> searchPlantByName(String searchValue) {
        List<PlantDTO> plants = new Vector<>();
        List<Plant> listPlantEntity = plantDAO.getPlantByTitle(searchValue);

        listPlantEntity.forEach(plant -> {
            PlantDTO plantDTO = new PlantDTO();

            List<TagDTO> tags = plantTagService.getTagsByPlantId(plant.getId())
                    .stream().map(tag -> {
                        TagDTO tagDTO = new TagDTO();
                        tagDTO.loadFromEntity(tag);
                        return tagDTO;
                    }).collect(Collectors.toList());


            List<CategoryDTO> categories = plantCategoryService.getCategoriesByPlantId(plant.getId()).stream().map(category -> {
                CategoryDTO categoryDTO = new CategoryDTO();
                categoryDTO.loadFromEntity(category);
                return categoryDTO;
            }).collect(Collectors.toList());

            plantDTO.loadFromEntity(plant, tags, categories);

            plants.add(plantDTO);
        });

        return plants;
    }

}
