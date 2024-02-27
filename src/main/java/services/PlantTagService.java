package services;

import daos.impl.TagDao;
import entities.Tag;

import java.util.List;

public class PlantTagService {
    private TagDao tagDao;
    private static PlantTagService instance;

    private PlantTagService() {
        tagDao = TagDao.getInstance();
    }

    public static PlantTagService getInstance() {
        if (instance == null) {
            instance = new PlantTagService();
        }
        return instance;
    }

//    public List<Tag> getTop6TagHasPlant() {
//        return tagDao.getTop6TagHasPlant();
//    }

    public List<Tag> getAllPlantTag() {
        return tagDao.getAllTag();
    }

    public Tag getTagByName(String name) {
        return tagDao.getTagByName(name);
    }

    public List<Tag> getTagsByPlantId(int id) {
        return tagDao.getTagByPlantId(id);
    }

}
