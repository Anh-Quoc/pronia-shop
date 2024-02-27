package daos;

import mappers.RowMapperInterface;

import java.util.List;

public interface GenericDaoInterface<T> {
    List<T> executeQuery(String sql, RowMapperInterface<T> rowMapper, Object... parameters);

    Long executeUpdate(String sql, Object... parameters);

    int count(String sql, Object... parameters);
}
