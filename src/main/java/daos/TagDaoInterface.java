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

    void updateTag(Tag tag);

    void deleteTag(int id);

    void deleteTag(Tag tag);
}
