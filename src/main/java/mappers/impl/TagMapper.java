package mappers.impl;

import dtos.TagDTO;
import entities.Tag;
import mappers.DTOMapper;
import mappers.RowMapperInterface;

import java.sql.ResultSet;

public class TagMapper implements RowMapperInterface<Tag>, DTOMapper<TagDTO, Tag> {

    @Override
    public Tag mapRow(ResultSet rs) {
        Tag plantTag = new Tag();
        try {
            plantTag.setId(rs.getInt("id"));
            plantTag.setName(rs.getString("name"));
        } catch (Exception e) {
            return null;
        }
        return plantTag;
    }
}
