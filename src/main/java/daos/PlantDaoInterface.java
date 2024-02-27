package daos;

import entities.Plant;

import java.util.List;

public interface PlantDaoInterface {

    Plant getPlantById(int id);

    List<Plant> getAllPlant();
    List<Plant> getFeaturedPlant();
    List<Plant> getBestsellerPlant();
    List<Plant> getLatestPlant();
    List<Plant> getPlantByTitle(String title);
    List<Plant> getRelatedPlant(int plantId);

    void savePlant(Plant plant);
    void updatePlant(Plant plant);
    void deletePlant(int id);
    void deletePlant(Plant plant);


}
