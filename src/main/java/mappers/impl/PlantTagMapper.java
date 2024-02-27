package mappers.impl;

import entities.Tag;
import mappers.RowMapperInterface;

import java.sql.ResultSet;

public class PlantTagMapper implements RowMapperInterface<Tag> {
    @Override
    public Tag mapRow(ResultSet rs) {

        Tag plantTag = new Tag();
        try {
            plantTag.setId(rs.getInt("tag_id"));
            plantTag.setName(rs.getString("tag_name"));
            return plantTag;
        } catch (Exception e) {
            return null;
        }
    }
}
