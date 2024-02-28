package services;

import daos.impl.TagDao;
import dtos.TagDTO;
import entities.Tag;

import java.util.List;
import java.util.stream.Collectors;

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

    public List<Tag> getAllActivePlantTag() {
        return tagDao.getAllActiveTag();
    }

    public Tag getTagByName(String name) {
        return tagDao.getTagByName(name);
    }

    public List<Tag> getTagsByPlantId(int id) {
        return tagDao.getTagByPlantId(id);
    }

    public void createNewTag(TagDTO tag) {

        Tag tagEntity = new Tag();
        tagEntity = tagDao.getTagByName(tag.getName());

        if (tagEntity == null) {
            tagEntity = new Tag();
            tagEntity.setName(tag.getName());
        }
        tagDao.saveTag(tagEntity);
    }

    public void saveTagsForPlant(Integer plantId, List<Tag> tags) {
        List<Tag> tagEntities = tags
                .stream()
                .map(tagDTO -> tagDao.getTagByName(tagDTO.getName()))
                .collect(Collectors.toList());

        tagDao.deleteTagsForPlant(plantId);
        tagDao.saveTagsForPlant(plantId, tagEntities);
    }

    public void updateTagsForPlant(Integer plantId, List<Tag> tags) {
        List<Tag> tagEntities = tags
                .stream()
                .map(tagDTO -> tagDao.getTagByName(tagDTO.getName()))
                .collect(Collectors.toList());
        tagDao.updateTagsForPlant(plantId, tagEntities);
    }

}
