package daos;

import entities.Plant;

import java.util.Vector;
import java.util.stream.Collectors;

public class PlantDAO {

    private static PlantDAO instance = null;
    private Vector<Plant> plants;
    private PlantDAO() {
        plants = new Vector<>();
        plants.add(new Plant(1, "Cactus_1", "Cactus is a plant", "https://cdn.blossominggifts.com/media/catalog/product/cache/7/image/9df78eab33525d08d6e5fb8d27136e95/r/e/red-rose-plant-dark-grey-pot.webp", "Green", 10.0, "Cactus", 100, null, "In stock"));
        plants.add(new Plant(2, "Cactus_2", "Cactus is a plant", "https://cdn.blossominggifts.com/media/catalog/product/cache/7/image/9df78eab33525d08d6e5fb8d27136e95/1/0/100-springtime-tulips-vase.webp", "Green", 10.0, "Cactus", 100, null, "In stock"));
        plants.add(new Plant(3, "Cactus_3", "Cactus is a plant", "https://cdn11.bigcommerce.com/s-i7i23daso6/images/stencil/1280x1280/products/9106/13820/Clematis_Taiga_0011240__31226.1638273410.jpg?c=1", "Green", 10.0, "Cactus", 100, null, "In stock"));
        plants.add(new Plant(4, "Cactus_4", "Cactus is a plant", "https://hortology.co.uk/cdn/shop/products/Ficus-elastica-Robusta-Rubber-Plant-12x35cm_2000x.jpg?v=1704197517", "Green", 10.0, "Cactus", 100, null, "In stock"));
        plants.add(new Plant(5, "Cactus_5", "Cactus is a plant", "https://hortology.co.uk/cdn/shop/products/Ficus-elastica-Robusta-Rubber-Plant-12x35cm_2000x.jpg?v=1704197517", "Green", 10.0, "Cactus", 100, null, "In stock"));
        plants.add(new Plant(6, "Cactus_6", "Cactus is a plant", "https://hortology.co.uk/cdn/shop/products/Ficus-elastica-Robusta-Rubber-Plant-12x35cm_2000x.jpg?v=1704197517", "Green", 10.0, "Cactus", 100, null, "In stock"));
        plants.add(new Plant(7, "Cactus_7", "Cactus is a plant", "https://hortology.co.uk/cdn/shop/products/Ficus-elastica-Robusta-Rubber-Plant-12x35cm_2000x.jpg?v=1704197517", "Green", 10.0, "Cactus", 100, null, "In stock"));
        plants.add(new Plant(8, "Cactus_8", "Cactus is a plant", "https://hortology.co.uk/cdn/shop/products/Ficus-elastica-Robusta-Rubber-Plant-12x35cm_2000x.jpg?v=1704197517", "Green", 10.0, "Cactus", 100, null, "In stock"));
    }

    public static PlantDAO getInstance() {
        if (instance == null) {
            instance = new PlantDAO();
        }
        return instance;
    }

    public Vector<Plant> getAllPlant() {
        return plants;
    }

    public Vector<Plant> getFeaturedPlant() {
        return plants;
    }

    public Vector<Plant> getBestsellerPlant() {
        return plants;
    }

    public Vector<Plant> getLatestPlant() {
        return plants;
    }

    public Vector<Plant> getNewPlants() {
        return plants;
    }

    public Plant getPlantById(int id) {
        return plants.stream()
                .filter(plant -> plant.getId() == id)
                .findFirst()
                .orElse(null);
    }

    public Vector<Plant> getPlantByTitle(String productTitle) {
        return plants.stream()
                .filter(plant -> plant.getTitle().contains(productTitle))
                .collect(Collectors.toCollection(Vector::new));

    }
}
