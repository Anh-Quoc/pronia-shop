package services;


import daos.impl.PlantDao;

import dtos.*;
import entities.Category;
import entities.Plant;
import entities.Tag;

import java.util.List;
import java.util.Vector;
import java.util.stream.Collectors;

public class PlantService {

    private final Integer PAGE_SIZE = 9;
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

    public List<PlantDTO> getAllActivePlants(){
        List<PlantDTO> plants = new Vector<>();
        List<Plant> listPlantEntity = plantDAO.getAllActivePlant();

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

    public List<PlantDTO> getAllActivePlants(Integer pageNumber){
        List<PlantDTO> plants = new Vector<>();
        List<Plant> listPlantEntity = plantDAO.getAllActivePlant(pageNumber, PAGE_SIZE);

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

    public List<PlantDTO> getAllActivePlantsOrderByPriceAsc(){
        List<PlantDTO> plants = new Vector<>();
        List<Plant> listPlantEntity = plantDAO.getAllActivePlantOrderByPriceAsc();

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

    public List<PlantDTO> getAllActivePlantsOrderByPriceDesc(){
        List<PlantDTO> plants = new Vector<>();
        List<Plant> listPlantEntity = plantDAO.getAllActivePlantOrderByPriceDesc();

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

    public Integer getNumberOfPages() {
        Integer totalPlants = plantDAO.getNumberOfPlants();
        return (int) Math.ceil((double) totalPlants / PAGE_SIZE);
    }


    public PlantDTO getPlantById(int id) {
        Plant plant = plantDAO.getActivePlantById(id);
        if (plant == null) {
            return null;
        }
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
        newPlant.loadFromDTO(plantDTO);

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

        // Save new plant to database
        Integer plantId = plantDAO.savePlant(newPlant);
        plantTagService.saveTagsForPlant(plantId, tags);
        plantCategoryService.saveCategoriesForPlant(plantId, plantCategories);
    }

    public void updatePlant(PlantDTO plantDTO) {
        Plant newPlant = new Plant();
        newPlant.loadFromDTO(plantDTO);

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

        // Save new plant to database
        plantDAO.updatePlant(newPlant);
        plantTagService.updateTagsForPlant(newPlant.getId(), tags);
        plantCategoryService.updateCategoriesForPlant(newPlant.getId(), plantCategories);
    }

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

    public void updatePlantQuantity(CartDTO cartDTO) {
        List<CartDetailDTO> cartDetails = cartDTO.getCartDetails();
        for (CartDetailDTO cartDetail : cartDetails) {
            Plant plant = plantDAO.getPlantById(cartDetail.getProductId());
            int quantity = plant.getQuantity() - cartDetail.getQuantity();
            if(quantity > 0) {
                plantDAO.updatePlantQuantity(cartDetail.getProductId(), quantity);
            }
        }
    }

}
