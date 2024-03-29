package daos.impl;

import daos.TagDaoInterface;
import dtos.TagDTO;
import entities.Tag;
import mappers.impl.PlantTagMapper;
import mappers.impl.TagMapper;

import java.util.List;

public class TagDao extends GenericDao<Tag> implements TagDaoInterface {

    private final String SELECT_TAG_OF_PLANT_BY_PLANT_ID_STATEMENT = "SELECT * FROM plant_with_tags_view WHERE id = ?";
    private final String SELECT_ALL_TAG_STATEMENT = "SELECT * FROM tags";

    private final String SELECT_TAG_BY_NAME = "SELECT * FROM tags WHERE name = ?";

    private final String SELECT_TAG_BY_ID_STATEMENT = "SELECT * FROM tags WHERE id = ?";

    private final String INSERT_TAG_STATEMENT = "INSERT INTO tags (name) VALUES (?)";

    private final String INSERT_PLANT_TAG_STATEMENT = "INSERT INTO plant_tags(plant_id, tag_id) VALUES (?, ?)";

    private final String UPDATE_TAG_STATEMENT = "UPDATE tags SET name = ? WHERE id = ?";

    private final String UPDATE_PLANT_TAG_STATEMENT = "UPDATE plant_tags SET tag_id = ? WHERE plant_id = ?";

    private final String DELETE_TAG_STATEMENT = "UPDATE tags SET active = 0 WHERE id = ?";

    private final String DELETE_PLANT_TAG_STATEMENT = "DELETE FROM plant_tags WHERE plant_id = ?";

    private final String SELECT_TOP_6_TAG_HAS_PLANT_STATEMENT = "SELECT TOP 6 tag_name, COUNT(tag_name) AS tag_count FROM plant_with_tags_view " +
            "GROUP BY tag_name " +
            "ORDER BY tag_count DESC";

    private static TagDao instance;

    private TagDao() {
    }

    public static TagDao getInstance() {
        if (instance == null) {
            instance = new TagDao();
        }
        return instance;
    }


    @Override
    public List<Tag> getAllTag() {
        List<Tag> tags = executeQuery(SELECT_ALL_TAG_STATEMENT, new TagMapper());
        return tags;
    }

    @Override
    public List<Tag> getAllActiveTag() {
        List<Tag> tags = executeQuery(SELECT_ALL_TAG_STATEMENT + " WHERE active = 1", new TagMapper());
        return tags;
    }

    @Override
    public Tag getTagById(int id) {
        Tag tag = executeQuery(SELECT_TAG_BY_ID_STATEMENT, new TagMapper(), id).get(0);
        return tag;
    }

    @Override
    public List<Tag> getTagByPlantId(int id) {
        List<Tag> tags = executeQuery(SELECT_TAG_OF_PLANT_BY_PLANT_ID_STATEMENT + " AND active = 1", new PlantTagMapper(), id);
        return tags;
    }

    @Override
    public Tag getTagByName(String name) {
        List<Tag> tags = executeQuery(SELECT_TAG_BY_NAME, new TagMapper(), name);
        if (!tags.isEmpty()) {
            return tags.get(0);
        }
        return null;
    }

    @Override
    public List<Tag> getTagOfPlantByPlantId(int plantId) {
        List<Tag> tags = executeQuery(SELECT_TAG_OF_PLANT_BY_PLANT_ID_STATEMENT, new TagMapper(), plantId);
        return tags;
    }

//    @Override
//    public List<TagDTO> getTop6TagHasPlant() {
//        List<TagDTO> tags = executeQuery(SELECT_TOP_6_TAG_HAS_PLANT_STATEMENT, new TagMapper());
//        return tags;
//    }

    @Override
    public void saveTag(Tag tag) {
        executeUpdate(INSERT_TAG_STATEMENT, tag.getName());
    }

    @Override
    public void saveTagsForPlant(int plantId, List<Tag> tags) {
        for (Tag tag : tags) {
            executeUpdate(INSERT_PLANT_TAG_STATEMENT, plantId, tag.getId());
        }

    }

    @Override
    public void updateTag(Tag tag) {
        executeUpdate(UPDATE_TAG_STATEMENT, tag.getName(), tag.getId());
    }

    @Override
    public void updateTagsForPlant(int plantId, List<Tag> tags) {
        deleteTagsForPlant(plantId);
        saveTagsForPlant(plantId, tags);
    }

    @Override
    public void deleteTag(int id) {
        executeUpdate(DELETE_TAG_STATEMENT, id);
    }

    @Override
    public void deleteTagsForPlant(int plantId) {
        executeUpdate(DELETE_PLANT_TAG_STATEMENT, plantId);
    }

    @Override
    public void deleteTag(Tag tag) {
        executeUpdate(DELETE_TAG_STATEMENT, tag.getId());
    }




}
