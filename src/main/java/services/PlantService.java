package services;

import daos.PlantCategoryDAO;
import daos.PlantDAO;
import entities.Plant;
import entities.PlantCategory;

import java.util.Vector;

public class PlantService {

    private PlantDAO plantDAO;
    private PlantCategoryDAO plantCategoryDAO;

    public PlantService() {
        plantDAO = PlantDAO.getInstance();
        plantCategoryDAO = PlantCategoryDAO.getInstance();
    }

    public Vector<Plant> getAllPlant() {
        Vector<Plant> plants = plantDAO.getAllPlant();
        return plants;
    }

    public Vector<Plant> searchPlantByTitle(String productTitle){
        return plantDAO.getPlantByTitle(productTitle);
    }

    public Plant getPlantById(int id) {
        Plant plant = plantDAO.getPlantById(id);
        return plant;
    }

    public Vector<Plant> getFeaturedPlants() {
        Vector<Plant> plants = plantDAO.getFeaturedPlant();
        return plants;
    }

    public Vector<Plant> getBestsellerPlants() {
        Vector<Plant> plants = plantDAO.getBestsellerPlant();
        return plants;
    }

    public Vector<Plant> getLatestPlants() {
        Vector<Plant> plants = plantDAO.getLatestPlant();
        return plants;
    }

    public Vector<Plant> getRelatedPlant(int id){
        Vector<Plant> plants = plantDAO.getRelatedPlant(id);
        return plants;
    }

    public Vector<PlantCategory> getTop6CategoryHasPlant() {
        Vector<PlantCategory> plantCategories = plantCategoryDAO.getTop6CategoryHasPlant();
        return plantCategories;
    }

}
