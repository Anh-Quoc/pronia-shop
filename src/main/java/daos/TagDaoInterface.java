package daos;

import entities.Tag;

import java.util.List;

public interface TagDaoInterface {
    List<Tag> getAllTag();

    Tag getTagById(int id);

    List<Tag> getTagByPlantId(int id);

    Tag getTagByName(String name);

    List<Tag> getTagOfPlantByPlantId(int plantId);

//    List<Tag> getTop6TagHasPlant();

    void saveTag(Tag tag);

    void saveTagsForPlant(int plantId, List<Tag> tagId);

    void updateTag(Tag tag);

    void updateTagsForPlant(int plantId, List<Tag> tags);

    void deleteTag(int id);

    void deleteTagsForPlant(int plantId);

    void deleteTag(Tag tag);
}
